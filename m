Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332C13AF2
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751766988; cv=none; b=IOQBxxdjWQ3HBZr0VClq1SIBAQlONrEjQq8+dVGCIFr6Iwy3cBCu+t4XNvDr/rCnW/b7x9mUHbKu1rY+dKrFeMUU1gA4YY+6A0x2KjNvwZWczSoin4+/hTK731oaP8iQpdZJInk1GCXyT5OCIvCkwqVOjLhzyWOgu+zxhTfH2Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751766988; c=relaxed/simple;
	bh=+Y6URF+Mjmjx0Myx6IS+aoV/fsuOzLJBHrdM7aQ/r18=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=sK+1BMJdjap4/XbWas9aLw+t8Sy+suOhmw00HpNVcBQXPlzFHUeyNzFSe0L3z/gA5ypQrKt7O2qd0furaODejFR3zodXl9yum/+8K9RT8Y1a7T+39jxFhMz+q7PIKEzN3G4WYlMiBC6maAsKh/pm2W3qMnByK5l5gjaa18dhBes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=X5Zn4MKB; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="X5Zn4MKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751766678; bh=nfywyY3/BNtC1h+g0NTGdTHGHIIT0pPY4GVmHu78bv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X5Zn4MKBHqfEr8G8/IeIMKtu4amU1id/QnSkKovxTLlgoaJkR8jpa44g6z7WQYFnp
	 0TdZIVjgOy3KXu8A+AmCio9dxRgxn0hautwGslOl5y/SrTmJWmEWOIy66NodcwaKc2
	 nwa7Isx2JWNQrJUz52XsPu2D1Td4ZcsRNhRJWYXw=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id CD0B34AC; Sun, 06 Jul 2025 09:51:16 +0800
X-QQ-mid: xmsmtpt1751766676twugahrfs
Message-ID: <tencent_9DD23CBB367696BA36224B34755576736609@qq.com>
X-QQ-XMAILINFO: OQ59tfF64tJLnxBo9Xp6+w4TuApaaoqCvqLWHtf1ptLRDTVY/9Lr1SdD9N8Q7l
	 ToY/ZG5+pHuVbK3QvBxVlX24eKMFrbAB3YbiMfVOnfjV245nHmhw6ON2BfJ71zVrXfQteYaQRNh7
	 NZBEVNkCmFrrtMxvT3j5RCw8yDhjWCjyXO+jzCt/xj4ARdkiN8O8SrTEvXKaS7xci4QO5L0S1QFA
	 +BKgpr5kmK9I40nJwlbw6HhfztyMm2QIFuuJI+jfcC17it6uQAoNJj7c/L0wdUmkUgQFWBD6+uYM
	 +t1sg6cQJG0bkyEqDxlmIQaPD98NGSKy0G4/LuPDC2eeZcsyKfNiVmkePEUIK8Z3YQyLHYgbwvYU
	 OIXuRGlmvRTVmOj9IlqOpNgsWCIFYuBEWZztd9YXOBd8v2FUAmFBG7xeohyGc3bp1ACBzTZjSbp8
	 +gGfANQdZRgE4wx6rm/M0l0MeGYgkgIMLLg2nVcb16KlMk2quzNbHW+wnbEYUrUAgXVus7EsH1f0
	 vTwe6VpbpwLGBbYzEVUYInSbWLloD62uT27S/HLpGKerKaqlYemMOe7MqqE0I6yqnuBaZlA572dz
	 Lr//X4NBXZNaW9A3WeBDsZJZOwNMJGRNSs/PPy7g06q+hJbvgqLpB9hYd5rifAHOzoThYzZt9nDf
	 ryilmdnTh98PUtgw+9Wkdu77pY87z3HFJJG94149olAkZgBGcfma5jEAojm8Peo5Ky09S+tWdF2b
	 R+Vy3ORfINXAqHtzvXzovVTYZuvRkjJNmcDklxX5SDOm9Lg4T/xrRSVhYDwrajfbHASJjo9oW2t6
	 P6+sa4Rq6eYlYzAN+XIJtCI+yNPHKrR8RRxGadoDlYqk07yQ0FCcyOFNM/CjbKbIk1U45Usf8hJT
	 3Ey3ny5RKuKkUke2iKmFMwkAQfxk2U+k/v2+vOUW6cawSf6PzEk4G303wdcCEUhOXxjD9qhdRo
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl726_attach
Date: Sun,  6 Jul 2025 09:51:16 +0800
X-OQ-MSGID: <20250706015115.2884085-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <68690648.a00a0220.c7b3.0037.GAE@google.com>
References: <68690648.a00a0220.c7b3.0037.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/comedi/drivers/pcl726.c b/drivers/comedi/drivers/pcl726.c
index 0430630e6ebb..8802f33f1954 100644
--- a/drivers/comedi/drivers/pcl726.c
+++ b/drivers/comedi/drivers/pcl726.c
@@ -328,6 +328,9 @@ static int pcl726_attach(struct comedi_device *dev,
 	 * Hook up the external trigger source interrupt only if the
 	 * user config option is valid and the board supports interrupts.
 	 */
+	if (it->options[1] < 0 || it->options[1] > 31)
+		return -EINVAL;
+
 	if (it->options[1] && (board->irq_mask & (1 << it->options[1]))) {
 		ret = request_irq(it->options[1], pcl726_interrupt, 0,
 				  dev->board_name, dev);

