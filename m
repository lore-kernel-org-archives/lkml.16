Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2183A48
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045495; cv=none; b=N+URGvKebTHsL7FG3QLHVt6t/IcKe6WgKrRmSnZLY59j5pppqov1yrKYnfOpyJILxSuF/obuYqgTP08LcYAvPk4/vRJloRuvZL3AeOnFCs7VBYgJgTLXpFYMZ5FJ2icsraqiY/4ziANSQ3aHfJJUdjm2MYgQ4iCGiV+wuPr15kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045495; c=relaxed/simple;
	bh=Q2OwWlfxC87C67+mrz/r2xM4PeLmbSRaO+mF/riJBdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=RGTwtbEEhM9bbuE57FTNnJs5u5eynJ13wSYyxmc46pThfh/h5en1N3fFEQwYaphptPwozF/hcBxF+NpOXzlhSigk4o3Zm8K1/4tHCvgxPhhY0xBkcOTSGGHC6n+PiXtFcbhkeqFo/A/tdtEOAdiucnU6o/ZDzJYNtq2RLdg/rdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=b3iu1jEZ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="b3iu1jEZ"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250327031809epoutp02aca6f564bceae22fc9c4eab3a86b3629~wiqNBH61o1251412514epoutp02W
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:18:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250327031809epoutp02aca6f564bceae22fc9c4eab3a86b3629~wiqNBH61o1251412514epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743045489;
	bh=bRX/mZlyH+iFulPSJq57+3ZhcRchtRZKVdIoGV0Vxlk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b3iu1jEZgy0XHTWTnH6yV4lopHc/D10Y9/EleB6cRz6CKlpby6O+a+CABg1lp61U/
	 CUH4Ekz/al3BEBTmuUr9jtXty20ELNt+woTlChto6XpD23P1eZtg466IPKxeQj9eK8
	 ntZ5Bj6Q7/1fSH99xnTnhN9GFG28MxjscRMIiBNw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250327031809epcas2p40c601881c8fe791fc56ebffc892e9b18~wiqMj3VjW0672406724epcas2p4a;
	Thu, 27 Mar 2025 03:18:09 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.70]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZNTPX37q4z6B9m4; Thu, 27 Mar
	2025 03:18:08 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	A1.9A.09871.073C4E76; Thu, 27 Mar 2025 12:18:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250327031807epcas2p2bef23593c044ed18b100b2b4f0fed43c~wiqLg6PS_2870328703epcas2p2W;
	Thu, 27 Mar 2025 03:18:07 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250327031807epsmtrp296d824e6664ba2f696aa05e49b66aef9~wiqLgF4ca3014530145epsmtrp2h;
	Thu, 27 Mar 2025 03:18:07 +0000 (GMT)
X-AuditID: b6c32a48-b95f07000000268f-44-67e4c370bd89
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	56.60.08805.F63C4E76; Thu, 27 Mar 2025 12:18:07 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250327031806epsmtip104bc1a6c480789f06e411bf1819f0539~wiqJxQSVF2007220072epsmtip1d;
	Thu, 27 Mar 2025 03:18:06 +0000 (GMT)
Date: Thu, 27 Mar 2025 12:22:19 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
	<saravanak@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vincent
	Guittot <vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	hajun.sung@samsung.com, d7271.choe@samsung.com, joonki.min@samsung.com,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <Z+TEa8CVAYnbD/Tu@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8634f0mall.wl-maz@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmmW7B4SfpBleWiVpc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktWi69BfNovNm6YyWxxfG27RceQbs8XiA5/YHXg8
	tu3exuqxYFOpx6ZVnWwed67tYfN4d+4cu8fmJfUefVtWMXp83iQXwBGVbZORmpiSWqSQmpec
	n5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdKqSQlliTilQKCCxuFhJ386m
	KL+0JFUhI7+4xFYptSAlp8C8QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj36rbLAWLpCrWvtjC
	0sA4U6SLkZNDQsBE4vCU66xdjFwcQgI7GCVOzz7BAuF8YpSY1HqfDcL5xijx/N4FVpiWS2vn
	Q7XsZZT4/PclVNVDRokv996wg1SxCKhKvL67gRHEZhPQldh24h+YLSKgKPHpwklGkAZmgT9M
	Eu/ObgRq4OAQFoiSeNweB1LDK6AscWjrDBYIW1Di5MwnLCAlnALaEhPma4O0Sghs4ZA4tfc4
	I8RFLhIrzvQzQ9jCEq+Ob2GHsKUkPr/bywZhF0s03L/FDNHcwihx6voLqAZjiVnP2hlBFjAL
	ZEjsuF8IYkoA3XDkFtgJzAJ8Eh2H/7JDhHklOtqEIBrVJH5N2QB1gYzE7sUroAZ6SLR+bWGC
	BMk0Rom58z6yTGCUm4Xkm1kIyyBMTYn1u/RngS2Tl2jeOpsZIiwtsfwfB5KKBYxsqxjFUguK
	c9NTi40KTOBRnZyfu4kRnIa1PHYwzn77Qe8QIxMH4yFGCQ5mJRHeY6wP04V4UxIrq1KL8uOL
	SnNSiw8xmgIjaSKzlGhyPjAT5JXEG5pYGpiYmRmaG5kamCuJ81bvaEkXEkhPLEnNTk0tSC2C
	6WPi4JRqYHKbMV320U3lRx6/Uub8sFx55cIVroMreC/YB5hNZHe/KJyst9YvIn3PKm3m7sbT
	L7v3cv6YO23zzhdpQp3KyxaKlF6zat79upZj852VbxVzDocp7xJecszjx4KalffZGyyaMz5L
	Gsw6vt35/s3ZyY5Tfp4Ke/Z8RUnjvvyb1RfP8htPkfjy+HeX8PHPx/z1jgn8T+45Oyuo0G6V
	3M3KvXoGWsfU6+5fuueob7KI5enKw3WG+27Ua0e/viIgNO2hW+W3OIZlwQ6e29ra6vUYDqs9
	8H/q95R5so3kxtmHaqY22ERaMRyZ/7+0Y2Xm34e8y9xv9OydOuP+1g8f3WU3PL/YyVTAMH9t
	qCB3im2zqvA1JZbijERDLeai4kQAtr0t3UwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTjf/8JN0g6O7TCyu7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWrRdegvm8XmTVOZLY6vDbfoOPKN2WLxgU/sDjwe
	23ZvY/VYsKnUY9OqTjaPO9f2sHm8O3eO3WPzknqPvi2rGD0+b5IL4IjisklJzcksSy3St0vg
	ytg0fyV7wRHxipbZOg2M1wW7GDk5JARMJC6tnc/axcjFISSwm1Fi3/R1LBAJGYnbKy+zQtjC
	EvdbjkAV3WeU6N2yjQkkwSKgKvH67gZGEJtNQFdi24l/YLaIgKLEpwsnGUEamAUamCWm/Z4K
	NlVYIEpiz9tpYM28AsoSh7bOYIGYOoNR4s+1HhaIhKDEyZlPwGxmAXWJP/MuMXcxcgDZ0hLL
	/3FAhOUlmrfOBgtzCmhLTJivPYFRcBaS5llImmchNM9C0ryAkWUVo2RqQXFuem6xYYFRXmq5
	XnFibnFpXrpecn7uJkZwjGlp7WDcs+qD3iFGJg7GQ4wSHMxKIrzHWB+mC/GmJFZWpRblxxeV
	5qQWH2KU5mBREuf99ro3RUggPbEkNTs1tSC1CCbLxMEp1cDkYWr3Zr1a1p/wzgfnHz/eKf/L
	cl5S/t07VqlV0daS9785/LS22/Rqmg5LXvOa1+8+n7/guuecSnyx+gRer1+LZfr5nzmmaz1m
	mlMRfebzz0fr2w8rsIhWd6nITKxqalCf/mHVjIiDHzdriUtpRB0+Wx8U0PfHTPP7xcKzZ996
	bFf8u/EE24+v35na6vsen+S2Zvjv3DBvW8q8B+s12JYanFn75aKZ16eFTXJu1prJJ6wr2Avn
	77Fvlt9wvfsQo1v/rbWM/KyHPnYdllpU/tj6yRuuUIsawaV1zVptm4N/rC7fyefSmraKcbag
	+xx5c9fWuw3XL8a77ZnvKZ7/UU+nONimeHqP/rHKvTsblJuUWIozEg21mIuKEwGBFiobIAMA
	AA==
X-CMS-MailID: 20250327031807epcas2p2bef23593c044ed18b100b2b4f0fed43c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_33869_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_33869_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Wed, Mar 26, 2025 at 08:59:02AM +0000, Marc Zyngier wrote:
> On Wed, 26 Mar 2025 03:09:37 +0000,
> Youngmin Nam <youngmin.nam@samsung.com> wrote:
> > 
> > Hi.
> > 
> > On our SoC, we are using S2IDLE instead of S2R as a system suspend mode.
> > However, when I try to enable ARM GICv3 ITS driver (drivers/irqchip/irq-gic-v3-its.c),
> > I noticed that there is no proper way to invoke suspend/resume callback,
> > because it only uses syscore_ops, which is not called in an s2idle scenario.
> 
> This is *by design*.
> 
> > Please refer to the codes below.
> > 
> > <drivers/irqchip/irq-gic-v3-its.c>
> > 5028 static struct syscore_ops its_syscore_ops = {
> > 5029         .suspend = its_save_disable,
> > 5030         .resume = its_restore_enable,
> > 5031 };
> > ...
> > 5803         register_syscore_ops(&its_syscore_ops);
> > 
> > <kernel/power/suspend.c>
> > 444         if (state == PM_SUSPEND_TO_IDLE) {
> > 445                 s2idle_loop();
> > 446                 goto Platform_wake;
> > 447         }
> > 448
> > 449         error = pm_sleep_disable_secondary_cpus();
> > 450         if (error || suspend_test(TEST_CPUS)) {
> > 451                 log_suspend_abort_reason("Disabling non-boot cpus failed");
> > 452                 goto Enable_cpus;
> > 453         }
> > 454
> > 455         arch_suspend_disable_irqs();
> > 456         BUG_ON(!irqs_disabled());
> > 457
> > 458         system_state = SYSTEM_SUSPEND;
> > 459
> > 460         error = syscore_suspend();
> > 
> > How should we handle this situation ?
> 
> By implementing anything related to GIC power-management in your EL3
> firmware. Only your firmware knows whether you are going into a state
> where the GIC (and the ITS) is going to lose its state (because power
> is going to be removed) or if the sleep period is short enough that
> you can come back from idle without loss of context.
> 
> Furthermore, there is a lot of things that non-secure cannot do when
> it comes to GIC power management (most the controls are secure only),
> so it is pretty clear that the kernel is the wrong place for this.
> 
> I'd suggest you look at what TF-A provides, because this is not
> exactly a new problem (it has been solved several years ago).
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

Hi Marc,

First of all, I’d like to distinguish between the GICv3 driver (irq-gic-v3.c)
and the ITS driver (irq-gic-v3-its.c).

I now understand why the GICv3 driver doesn’t implement suspend and resume functions.
However, unlike the GICv3 driver, the ITS driver currently provides
suspend and resume functions via syscore_ops in the kernel.
And AFAIK, LPIs are always treated as non-secure. (Please correct me If I'm wrong).

The problem is that syscore_ops is not invoked during the S2IDLE scenario,
so we cannot rely on it in that context.
We would like to use these suspend/resume functions during S2IDLE as well.

Thanks.

------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_33869_
Content-Type: text/plain; charset="utf-8"


------rHPRFtJkdx5CiZJP2v5Cn8OZ9YZY2B0tfPkXi2gvBl6TiQFm=_33869_--
