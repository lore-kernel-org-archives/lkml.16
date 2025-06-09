Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17F2571A0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476273; cv=none; b=srnXft37oWcbOlJhc2H2Vz/NVdb1doLjXEBCXAZCfv+EmygaGE3o3NuwS/2tmzT1r+LWScAibj4Y2zXuoe9jzm6f6cU4h9TxfnFknhjN027p3mvEmEZTdUQTFHU9N3HMuTqlzIcRuQip7r4Z/sURsLQcHexipatgwFGjq5I3db0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476273; c=relaxed/simple;
	bh=fc2qhGvztsf8q/knOX16kAHyLZPLs9ftGOdSVSy+yFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDMNgKowGPefAC2InEJRd+qhINStos4UdSaBRnuD4mPTm2XiBrMbPfpb1eURASF3NLOAkJU9YwstMbVLMZf9iC3pjghRUgCoI54tjFEEcWJ8jej1+c+XUTtAF8+sJ/jzAQHeeChQIdX3jRc5H80bKukFu12jNUGK1DeMzt/Ss9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B3RlXVJZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B3RlXVJZ"
Date: Mon, 9 Jun 2025 09:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749476257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tBRBnENXmadTqQJMjeLOjTG4BqnAZ8D63VwftqdQrEc=;
	b=B3RlXVJZHv8D2KGiHvlasaKNAX9bQauGH/WjByG2jMpNhS0k1hxn9OBtNb0V9dNaDdwdU8
	7neEd/KGe7c1/amkTc76hcM6XfNgy22yPUL9XhfiiGuxhnd2oAKKIHt43xidbzd9USrIRl
	oM9FqrDca95XuXg1gPJjAtqUasGkr0Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com
Subject: Re: [PATCH] fix : slab-out-of-bounds Read in
 bch2_sb_members_v2_to_text
Message-ID: <ze2y4gmkk7fap5vsesxtwdy7pfbm7hkliysrfoqm666xniwev4@3uqwejstwiw3>
References: <20250609075613.27146-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609075613.27146-1-abhinav.ogl@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Jun 09, 2025 at 01:26:14PM +0530, Abhinav Ananthu wrote:
> BUG: KASAN: slab-out-of-bounds in members_v2_get fs/bcachefs/sb-members.c:68 [inline]
> BUG: KASAN: slab-out-of-bounds in bch2_sb_members_v2_to_text+0x1ae/0x310 fs/bcachefs/sb-members.c:347
> 
> bcachefs: fix slab-out-of-bounds read in bch2_sb_members_v2_to_text
> 
> syzbot reported a slab-out-of-bounds read in bch2_sb_members_v2_to_text().
> This function parses superblock member entries from a serialized array,
> but did not properly validate the bounds of each entry before accessing it.
> 
> When the function iterated over v->entries[], it assumed each
> bch_sb_field_members_v2_entry was fully contained within the buffer.
> However, if the structure was truncated or malformed, this could lead to
> reads beyond the end of the allocated slab, triggering memory safety bugs
> under KASAN and potentially leading to undefined behavior.
> 
> This patch adds a bounds check to ensure the offset does not exceed the
> total size of the entries buffer before accessing each entry. This
> prevents out-of-bounds access and resolves the bug.
> 
> Reported-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=<5138f00559ffb3cb3610>
> Fixes: 1c8dfd7ba50dbbb72113caf4fa7868512cdad2f4("KASAN: slab-out-of-bounds Read in bch2_sb_members_v2_to_text")
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>

I already have a better fix:
commit 3811a2d49e0d27cb120a617d461b171a268fb029
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sun Jun 8 11:31:23 2025 -0400

    bcachefs: Don't trust sb->nr_devices in members_to_text()
    
    We have to be able to print superblock sections even if they fail to
    validate (for debugging), so we have to calculate the number of entries
    from the field size.
    
    Reported-by: syzbot+5138f00559ffb3cb3610@syzkaller.appspotmail.com
    Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

diff --git a/fs/bcachefs/sb-members.c b/fs/bcachefs/sb-members.c
index 363eb0c6eb7c..c673e76ca27f 100644
--- a/fs/bcachefs/sb-members.c
+++ b/fs/bcachefs/sb-members.c
@@ -325,9 +325,12 @@ static void bch2_sb_members_v1_to_text(struct printbuf *out, struct bch_sb *sb,
 {
 	struct bch_sb_field_members_v1 *mi = field_to_type(f, members_v1);
 	struct bch_sb_field_disk_groups *gi = bch2_sb_field_get(sb, disk_groups);
-	unsigned i;
+	int nr = (vstruct_end(&mi->field) - (void *) &gi->entries[0]) / sizeof(gi->entries[0]);
+
+	if (nr != sb->nr_devices)
+		prt_printf(out, "nr_devices mismatch: have %i entries, should be %u", nr, sb->nr_devices);
 
-	for (i = 0; i < sb->nr_devices; i++)
+	for (int i = 0; i < nr; i++)
 		member_to_text(out, members_v1_get(mi, i), gi, sb, i);
 }
 
@@ -341,9 +344,17 @@ static void bch2_sb_members_v2_to_text(struct printbuf *out, struct bch_sb *sb,
 {
 	struct bch_sb_field_members_v2 *mi = field_to_type(f, members_v2);
 	struct bch_sb_field_disk_groups *gi = bch2_sb_field_get(sb, disk_groups);
-	unsigned i;
+	int nr = (vstruct_end(&mi->field) - (void *) &gi->entries[0]) / le16_to_cpu(mi->member_bytes);
+
+	if (nr != sb->nr_devices)
+		prt_printf(out, "nr_devices mismatch: have %i entries, should be %u", nr, sb->nr_devices);
+
+	/*
+	 * We call to_text() on superblock sections that haven't passed
+	 * validate, so we can't trust sb->nr_devices.
+	 */
 
-	for (i = 0; i < sb->nr_devices; i++)
+	for (int i = 0; i < nr; i++)
 		member_to_text(out, members_v2_get(mi, i), gi, sb, i);
 }
 
