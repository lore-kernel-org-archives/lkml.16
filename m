Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF41CAA89
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043399; cv=none; b=vBTQtfIfkC+iL5kmZknLDJQPTQWuvDXHVzVoelyrna6jl5pZWtZgE55+pSlsLY/N62LJefLJbbMMqvuQoh12L5OAJHpYTget06HVmq3KjHqprpqgxlMrizg3ifN9DbfIg/YTiLoHos5vcAphctbDaxgdG+ayWir2fwakWZ/ekH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043399; c=relaxed/simple;
	bh=Qne4eWZwEXtSMD2/rxGqDKbbUMbFF6b80iWm1yWBJ04=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=mN1c5uLfexTcjgHTbPOMKkxahkpBRpCLbyelIFtMcjh+CrMquANEQMBZD64nPR3pKhW9njwgNyGaUBytsX5S1eVfdOJOEx+WWShp/Vz9ld9Jnx6Sq5Xhwq9gGeYmNvEkUOkxjb82oQPWDCcyZbFc7lb0f5NZ1Fhp2wMJJRAXclo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=IP4dwv/F; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="IP4dwv/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744043386;
	bh=I+FxG1gHAelGVqFBfkieGZpkydYf2q1/HP45s5HvRZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IP4dwv/F5Fr60AV3MfwCiQY+YAMfCoezZczMT0bOfqzpEpG+B63KGyVVHH3Os4pGj
	 TwiYUN+cvUiLOzXV//QxXfdED/2JWwnRe41A03bs1n4coZTv17U6xuAewN+5O0ioi8
	 Jfr6XIua0xrf5EayUryqaxiq0HsP3Tqps3r6Pa5Y=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 5DD3CE78; Tue, 08 Apr 2025 00:23:29 +0800
X-QQ-mid: xmsmtpt1744043009tnd7z03gz
Message-ID: <tencent_4EBF99084F5A4A0D6C6AA5282D4FF23E6807@qq.com>
X-QQ-XMAILINFO: OQ59tfF64tJLDJjfAnNfYV+AuLoyzO91kjIbgdmyFI6ZXeHOgVOnhWb0wAVzDb
	 tUTKnrOa3S2+3DVmlIgrr6uzEjufj2m7FMDKtPgyt41qpLRTjpZueYbPkCOy6TRtFtjnh5/Bu+gx
	 dT5VRlOUBCRXzF3zDpDnfPVvPVG9qrFwea9jqSJj+pULJ+hT1kLXesbkmr44/ICxpLNG69lClb+m
	 yVJ2wmNyID3nzc4EHq45GHDWwT1kR5tOzf9KjFEfPqBE8iudOdUhcOBYclB+QGW35sNLoMsY+dKe
	 AfU+8+1QSruROL/1bH8CiWtjpmfIHq9+Y01uUleTYSbxmhrMxS5zYYE8Ca+A0lw9UJw9hIlTTY/c
	 cIcVyntT+O3REUtTHrjdtEFDKztk+bl2rY0z2RSDDzXMLIdO31jtW0conXGHW4ZSVCC6nObA2Uap
	 tQOEr4Q3AXh/0M/zHMUWDvvg6lEwyxBi6mTbSNT/2nSSv/bRfUnDjohPdy+hnc2qlWeomQSQuJMX
	 kNy5PStVr/ZxArOvoy69pb4n62jNsbDPb6cIXqQSNCyg1uzaDdAY/5rnX2DVLJL23AJH5uzAtt8Y
	 5PI7vWUKCJUK4OWbmX5T4cVOU3wW1h8qAQeynAVilNLND2PWJCoeOcnehozSVRbATw0yEMvRTiC4
	 YffNFyzHoyG1fWAHs59s/lcZMFzYnSNbyK7ulzBi33+ghI22hH90Btcfp0+FZGmLSS8IS8Wa4w5l
	 li7j6h3vqGDR0LCjc/8CHdFNXg+JHNXMFg5tjPpnX6bWNa73YNHK8jS4ahx5ng+sb6H43UsOv1rl
	 d6ffQWtDswy/1ZsRa7nXXuTfif5/E1PrPOtirwaFn2OXXyHwQV4JEscJTBw/zWNLchJMkpxxyZfT
	 7kYiPIi6VqlJ8keWnTGp+DANFLKV0E3DrWW/W0ffCR1esABrtvx5DF8cSXyyv8bGfe3CehJCZ7k7
	 vY8fXQTvxfpxaj4Kq0LOEt6pu1yiNE
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: zhoumin <teczm@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	teczm@foxmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Date: Tue,  8 Apr 2025 00:22:34 +0800
X-OQ-MSGID: <20250407162234.182798-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025040743-kick-computing-0ecd@gregkh>
References: <2025040743-kick-computing-0ecd@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > But I propose we should make call_usermodehelper_exec fail earlier, link
> > this:
> > --- a/lib/kobject_uevent.c
> > +++ b/lib/kobject_uevent.c
> > @@ -610,7 +610,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
> >
> > #ifdef CONFIG_UEVENT_HELPER
> > /* call uevent_helper, usually only enabled during early boot */
> > - if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
> > + if (uevent_helper[0] && !usermodehelper_disabled && !kobj_usermode_filter(kobj)) {
> > struct subprocess_info *info;
> >
> > retval = add_uevent_var(env, "HOME=/");
 
> Why? Will this actually change the speed of anything?

While the actual speed improvement may be minimal(may vary depending on
device performance and how many uevents are triggered before rootfs mount),
I just think executing add_uevent_var(), call_usermodehelper_setup(), and
call_usermodehelper_exec() is unnecessary in these cases. We can simply
return early. If you consider this change unnecessary, I'll respectfully
close this discussion and focus on other areas where more significant
improvements might be achieved. 

---
Appendix: QEMU Test Logs
In my current QEMU test environment, this code path executes
2,127 times before rootfs mount. Sample events collected via debug logs:
	pr_emerg("action:%s devpath:%s\n", action_string, devpath);

[    0.263272] action:add devpath:/bus/faux
[    0.264278] action:add devpath:/bus/faux/drivers/faux_driver
[    0.267476] action:add devpath:/bus/platform
[    0.267559] action:add devpath:/bus/auxiliary
[    0.267669] action:add devpath:/bus/memory
[    0.268789] action:add devpath:/devices/system/memory/memory8
[    0.269501] action:add devpath:/devices/system/memory/memory9
[    0.269664] action:add devpath:/devices/system/memory/memory10
[    0.269793] action:add devpath:/devices/system/memory/memory11
[    0.269889] action:add devpath:/devices/system/memory/memory12
[    0.270008] action:add devpath:/devices/system/memory/memory13
[    0.270108] action:add devpath:/devices/system/memory/memory14
[    0.270208] action:add devpath:/devices/system/memory/memory15
[    0.270297] action:add devpath:/devices/system/memory/memory16
[    0.270409] action:add devpath:/devices/system/memory/memory17
...
[    1.068185] action:add devpath:/devices/virtual/tty/tty58
[    1.069597] action:add devpath:/devices/virtual/tty/tty59
[    1.070887] action:add devpath:/devices/virtual/tty/tty60
[    1.071801] action:add devpath:/devices/virtual/tty/tty61
[    1.073554] action:add devpath:/devices/virtual/tty/tty62
[    1.075086] action:add devpath:/devices/virtual/tty/tty63
...
[    3.519928] action:add devpath:/devices/platform/gpio-keys/input/input0/event0
[    3.521347] action:remove devpath:/devices/virtual/devlink/amba:9030000.pl061--platform:gpio-keys
[    3.523161] action:bind devpath:/devices/platform/gpio-keys
[    3.523831] action:add devpath:/bus/platform/drivers/gpio-keys
[    3.529957] action:add devpath:/bus/amba/drivers/amba-proxy

Best regards,

zhoumin

