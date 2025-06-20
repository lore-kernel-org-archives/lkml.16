Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6B3D6F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382006; cv=pass; b=BWydTV0xIVD+GZnxz1mDg0eRM2YSb8RRLrzGUVBe9qyC2mbpOBHf6DMXZOlbzv2MeXcvS8Wgd5/UTU1WfiQ33bKKlJ3dfb8k6ieCunoJfiqPBgbVHePSasJpm9l/cipajc7MspNTmR+W/W1ZG+ptKsy12Cbo4PY27Fr6WRH92iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382006; c=relaxed/simple;
	bh=YmKobdGZUSacsiyLATDgDwmAZew/T1yJQI6qw1tTEj0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=F2M3nUyttbEiV3WE/CazgbwzuERNAsBWIRLtwxDcofy1lmsJfhEMBv8Oic5D1EAgdVCyn/8JGd3N2GqDOAfqN+Ov2Hbul7VXsbYLDWLjel33I+XavbJVtlCIhpgPVdfgkMZxXqHjVboKcZANxtOgg6coQZZhcO3db8dsvmh+6c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Y1DfbKel; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Y1DfbKel"
ARC-Seal: i=1; a=rsa-sha256; t=1750381999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RWICsVYz9D5kz5Wv+lxIftgaq3vmzlJAS9eRRSzQx4DAUDT3+IYmGR9VziDRc9CrQD7YfHVXAfaU79JPLKZEoHrzLuMPveaXp3gA43BvaUIoSrZ/CkXMGflvQXYo6njLii7HL0ZIn84zPGMQroG940XBz/HAOUpT/KvpBHR8QCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750381999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G7fSfnIWcOTg0+wJbxS+jNZ66J9fLlncXmafzZBIajE=; 
	b=kFV3W4BDZhLxhIAjWKjhCQ+pNHIi1IYrxRhYCqoHR4OmYWVInYq9t977TW3rljVJHR/rsSADEqpmcfyAk67VcsHkb87pZVnup+qGVO9xjuhpWYxyNMkP8CHwDAvq18oGIbdwJC1hHPbxkDzqceBdszIjAcQsnHfXePo5e82PviQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750381999;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G7fSfnIWcOTg0+wJbxS+jNZ66J9fLlncXmafzZBIajE=;
	b=Y1DfbKelwzSiiAqn5VsYH42otiAaBdyt8nkyq2qVz4nnwOfXdE30WZdkoearuosd
	+7gh/Ezs0CYd+iIe4KqRyYNbRle1yLXLdSVJ9RLLNzQw7zYVmWLD77NkFpiuromAwxE
	r5CRheVVeRxWhIY9eCwCNyQKpxajefTl9Psp5tTo=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750381997708180.63913494283224; Thu, 19 Jun 2025 18:13:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:13:17 +0800
From: Li Chen <me@linux.beauty>
To: "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1978ae5ae71.d8a9ec42669040.6118933001659818858@linux.beauty>
In-Reply-To: <87wm98aqem.fsf@mail.parknet.co.jp>
References: <20250619113809.274808-1-me@linux.beauty> <87wm98aqem.fsf@mail.parknet.co.jp>
Subject: Re: [PATCH] fs: fat: Prevent fsfuzzer from dominating the console
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi OGAWA,

 ---- On Thu, 19 Jun 2025 20:04:33 +0800  OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> wrote --- 
 > Li Chen <me@linux.beauty> writes:
 > 
 > > Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
 > > Reviewed-by: Bin Lai <laib2@chinatelecom.cn>
 > > ---
 > >  fs/fat/misc.c | 4 +++-
 > >  1 file changed, 3 insertions(+), 1 deletion(-)
 > >
 > > diff --git a/fs/fat/misc.c b/fs/fat/misc.c
 > > index c7a2d27120bab..75c2b59fbd532 100644
 > > --- a/fs/fat/misc.c
 > > +++ b/fs/fat/misc.c
 > > @@ -23,8 +23,10 @@ void __fat_fs_error(struct super_block *sb, int report, const char *fmt, ...)
 > >      struct fat_mount_options *opts = &MSDOS_SB(sb)->options;
 > >      va_list args;
 > >      struct va_format vaf;
 > > +    static DEFINE_RATELIMIT_STATE(fat_err_rs, DEFAULT_RATELIMIT_INTERVAL,
 > > +                                  DEFAULT_RATELIMIT_BURST);
 > >  
 > > -    if (report) {
 > > +    if (report && __ratelimit(&fat_err_rs)) {
 > >          va_start(args, fmt);
 > >          vaf.fmt = fmt;
 > >          vaf.va = &args;
 > 
 > Why didn't use fat_fs_error_ratelimit()?

Oops, I missed that. I'll use it in v2. Thanks!

Regards,
Li
