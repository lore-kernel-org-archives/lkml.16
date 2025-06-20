Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C635968
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382701; cv=none; b=n+nDCu434cHbwYuQqAg+A0NuIrcV/BYpafu0EdY9Rm2k9O8iPx2hw7VHLeyNRO78tic4OmEPNAE7Px76p8BWJkPZKbV+DgeOr7eB35hnKrepKTH8FHmik5MeTfWogssDA7KNY25OBTpoKb9KhR1vqENTo5cbQtuj4w0ZLR5BLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382701; c=relaxed/simple;
	bh=xXMlI7rpm3z9JLZGXMznkVZ0H27f9pBGFKN/B0zsoEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgKhy+YlZphLcjBzBkp0smTzOVbe7S4BGir6Dfyeyt5pRxWdyeFzDy16td0+heS187kg5XpGP6yp9NzqS9fGjLNjQIHIv4TKRnoXI4+ZGwpAKs4rzk9kftAaaHXEOqRDZvAQ6lVBJmsJpn/AAExUsxaZwcaglJiSAt07wgxd9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YPSmg/uw; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YPSmg/uw"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEegad026963
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=X46fh0ZZ1WeD/NYr5w40mQYpquA1g2f04LeJ0ONcmxE=;
 b=YPSmg/uwWqWtGNit0/X0eSqqIz7cpKxTTVyU2f1VKwLviwJL48VFuOSlEL6sul26oyw5
 Fx0oLE+3puaartKeVOcQ7NLQ92vPaDkREj/IhWjsyqYFFHGC/izDuMi9Qtq19vY5cSxq
 UHPqXFxY6HmjzoR8Lbg1YoQIwO48jZT7VRjHPq/ST6Y7kXuyONT75+rHfiufO/vJyEsn
 hxWHuvW6WcImCSfaeUHUFHiJTrt9Jnq8i/LG5e3szuYn0jPc0ntLyo1GPSXlMWP1bBBq
 mJaRKc23NmSEt3TjA610x5l2/tr3X3qi1qE9R7WGUDKw1EC/+sAnhsUxd4azXdbzfjhY vQ== 
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4793c041vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:24:53 -0400
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3eeab1223so166773785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382692; x=1750987492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X46fh0ZZ1WeD/NYr5w40mQYpquA1g2f04LeJ0ONcmxE=;
        b=Ie0Mkbc7JXFyKopgpaujMvlntvtzbUM2Ez3vRollRHkF5rwbMg7hEm0NHvWg9/00yy
         b77JNninBVcQ+PIsdvnkQmHAL1UOAD5kEc11BhmgM75edaxi8Kuds7jhbK1c0o3uL/K+
         62L0ow2MtrEiI/sVkLfVNGJm7wJkyLR+g3vHYwQxUJDjtL++frRRtfsOBuoalEZzAT/J
         oC/NETBmZLA3KoFNuM1wMEkBjCV9Q+dXQ/ebc/QiKMa/QXLCcybmiKTrgaoo/ZGAKLvB
         QnAx0BsY4YSGVngPn6nL95GtnDvHgvWYeq6Q0MnGqA5DcsJJGHrtyi/RjQBciIi4Qtw0
         NE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTE/2bLa1IW8KpOTxhUm+d8n5BqLnvnE+iADUXtYpyRB8ci6Xlvu2yHTDbkjDlO65liwfF3IxeHQWo9Sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypJ4vCVc1JduI5wyAR0dD7nYuOLXGy7UBiG48/UcLb4PiWJxzY
	DN6sYsDhf+IyeSpS64wRGsbrv0aDdPEfIr7t+FfUPr3D4IKBArLKfVI6/r5Mkwhtyh0EFaR04yF
	sKlPt/LuDLyn5rMLXkr33T5s+hBRu/g08n43Rv5EkEDBlN0o0D7Z6TheZMq3Rmw==
X-Gm-Gg: ASbGncththqeXlFJNTH48kec/QkTA+0bRoUKxxEXOmIc35sMU7vqFFKA8GmjiuUySSZ
	Rk1kv7BRodPt8FMjAPKeoF6COLMUNl1phGObAxXEdkefa6mCG0ExMxku3K3S1rgAzjI7aJWaeYa
	70SW+5GRaICRbypUc2YGooCfqqWeJL47af/zbKhkRVR/HIn0DLuBhK/0/uYkkl3MbCEEzwi0DWp
	Ju+A+ELroKp2s11IvjBtQVwxwfhv1N8mjxXQH3uAh5KPC+FLwY5QmsIG9BEhTMGxZOu5A+zC0Q5
	SxZb/T2Cj8Fha6ac8IgNL5y7IKH+y7nhW1UGfGYZROeFb3w4WGwNNEvxIPJIy6HKmuEe
X-Received: by 2002:a05:620a:198e:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d3fc06b8d5mr63538085a.24.1750382691971;
        Thu, 19 Jun 2025 18:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJKSrSBgQ4uBVzQlMagjxckiiQ/tQxOZmwuAqKpCEwLsdmkXuPSybt+Cb06ko5l86V7nuVZQ==
X-Received: by 2002:a05:620a:198e:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d3fc06b8d5mr63533785a.24.1750382690971;
        Thu, 19 Jun 2025 18:24:50 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79c12sm3794321cf.53.2025.06.19.18.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 18:24:50 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 19 Jun 2025 21:24:24 -0400
Subject: [PATCH v3 2/4] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-uffd-fixes-v3-2-a7274d3bd5e4@columbia.edu>
References: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
In-Reply-To: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750382688; l=2822;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=xXMlI7rpm3z9JLZGXMznkVZ0H27f9pBGFKN/B0zsoEE=;
 b=WzhBLDQrXcUIUlBCP8qTicibv+pXurkXgBplDu92U7x22Aj1+3bJyvMaG1h7d35DYp/eDYzJj
 iqoX7qrPiMQAmBmnvAIOMBdt+sMK+Un6Ig5Keny2IykvItTmx9ZCkVg
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: u4zVkJ5d4mqKzPsgLMDdXPziliqYUajH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwOCBTYWx0ZWRfX4gg2YrCn9dZg EdHY1K23Ra4/88fgGLEo//7b6Jn1CdkTgB2qfUOxRSI+G2O4B7AqPpiTODNVDQBGN5FzRsGf4b+ ScNJvlIe5mPj9BGUFvfyMdlAEIGkvWWd/FpTiI1RWgY1d0oPzUPm7xdqH2OCdVCTBF+NpNz+dmT
 RRwaabSI7CqqIL2qFDRc0dpzAcWawSfp2DKwzJlsC3n742ieiyIkuSg56/R7dI9/hfud7iwcm1T HtH8yf2yw45EmrJyrD4f1IOMF9FmN8D7uYnS0mM9IyrpoIjiUWEVc9zt2qjKaxIKwaTmi08gpfc H8J7ZjBOtTS5gakL+illQ49H1j3uU4PBr0m8EgvhEmjhBoYp2ON6vOg67eG8wnR6oSi3qo26tHq Zc9p0bM9
X-Proofpoint-ORIG-GUID: u4zVkJ5d4mqKzPsgLMDdXPziliqYUajH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=10
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=10 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200008

Currently, a VMA registered with a uffd can be unregistered through a
different uffd associated with the same mm_struct.

The existing behavior is slightly broken and may incorrectly reject
unregistering some VMAs due to the following check:

	if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
		goto out_unlock;

where wp_async is derived from ctx, not from cur. For example, a
file-backed VMA registered with wp_async enabled and UFFD_WP mode cannot
be unregistered through a uffd that does not have wp_async enabled.

Rather than fix this and maintain this odd behavior, make unregistration
stricter by requiring VMAs to be unregistered through the same uffd they
were registered with. Additionally, reorder the BUG() checks to avoid
the aforementioned wp_async issue in them. Convert the existing check to
VM_WARN_ON_ONCE() as BUG_ON() is deprecated.

This change slightly modifies the ABI. It should not be backported to
-stable. It is expected that no one depends on this behavior, and no
such cases are known.

While at it, correct the comment for the no userfaultfd case. This seems to
be a copy-paste artifact from the analogous userfaultfd_register() check.

Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory externalization")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/userfaultfd.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 22f4bf956ba1..8e7fb2a7a6aa 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1467,6 +1467,14 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
 		       !!(cur->vm_flags & __VM_UFFD_FLAGS));
 
+		/*
+		 * Prevent unregistering through a different userfaultfd than
+		 * the one used for registration.
+		 */
+		if (cur->vm_userfaultfd_ctx.ctx &&
+		    cur->vm_userfaultfd_ctx.ctx != ctx)
+			goto out_unlock;
+
 		/*
 		 * Check not compatible vmas, not strictly required
 		 * here as not compatible vmas cannot have an
@@ -1490,15 +1498,12 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	for_each_vma_range(vmi, vma, end) {
 		cond_resched();
 
-		BUG_ON(!vma_can_userfault(vma, vma->vm_flags, wp_async));
-
-		/*
-		 * Nothing to do: this vma is already registered into this
-		 * userfaultfd and with the right tracking mode too.
-		 */
+		/* VMA not registered with userfaultfd. */
 		if (!vma->vm_userfaultfd_ctx.ctx)
 			goto skip;
 
+		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx != ctx);
+		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
 		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
 
 		if (vma->vm_start > start)

-- 
2.39.5

