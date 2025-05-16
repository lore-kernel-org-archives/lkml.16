Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF386250
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378171; cv=none; b=FmzjefmSeGTtuR8U3W+WaEANO9/seYKD2mx40DSFSIn8/TmudUrSA2MSzvifI8dmDyvLNPLcrl+nmzXfPQqU+mckvjF9NtEuDXkdvRr3akyfT15uRj8XnaT3jv0yhD3J6UxAX/XzrWMnj0FNe7y2rECerH6ozuo60xvJXPWgToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378171; c=relaxed/simple;
	bh=ETPUvd+Wu9KCeh5ub6TK+4dTcmzJXIfQ/od7UewXjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 References; b=BKEV+fkfQ3uxk11NcbmbyGxJFELeJXKDY44mwDlhFntCo2eSNGViwB7SVkhEwFVhSUgupBmDxAJSrOItFFQudg86Peg5Bs/4jkcvrDSNLVkp2GKfjaVFqnD5g0uInaw2P50ezXugwbj38DyLL7tZXPUP1GopI7RIy8w9STxueis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YiJGYxMJ; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YiJGYxMJ"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250516064926epoutp02fbc0786d65d8693cf7ff739b004415cb~-7y89pk3i0070000700epoutp02X
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:49:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250516064926epoutp02fbc0786d65d8693cf7ff739b004415cb~-7y89pk3i0070000700epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747378166;
	bh=iYu1W65d4aeFd6OvF67vEVZwGzMfLuw3crP4cuShCis=;
	h=Date:From:To:Cc:Subject:References:From;
	b=YiJGYxMJZIGdt1e35GDgWiXwO1YBW9VRL3dnDt0hY4AavbI5lPFSBn4fYmkZbui7W
	 1ShtwuS2lZbQjlzbZhWsX6tTOYK9h8pQkhXjWbAyi2T2xeINaetFxCPKoC5Z2POS3w
	 YekaXkaR7BL11ht8LdgxmL0mKKmRgJ4IRV6c7mgE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250516064925epcas2p3c0b4dd50eecf6ac0ba1d539b2beaaac8~-7y8MPVwM0507105071epcas2p3N;
	Fri, 16 May 2025 06:49:25 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZzHkD72Cjz6B9mP; Fri, 16 May
	2025 06:49:24 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770~-7y61sHzM1774717747epcas2p2I;
	Fri, 16 May 2025 06:49:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516064924epsmtrp1818ec032d326a6f7fee6edbb309d0857~-7y60jS611520215202epsmtrp1A;
	Fri, 16 May 2025 06:49:24 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-da-6826dff4953d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.14.08766.4FFD6286; Fri, 16 May 2025 15:49:24 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250516064924epsmtip146597e4c87a451500848ddb378884dc4~-7y6ktU0k1210412104epsmtip1K;
	Fri, 16 May 2025 06:49:24 +0000 (GMT)
Date: Fri, 16 May 2025 15:53:58 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	junhosj.choi@samsung.com, hajun.sung@samsung.com, joonki.min@samsung.com,
	d7271.choe@samsung.com, jkkkkk.choi@samsung.com, jt1217.kim@samsung.com,
	qperret@google.com, willdeacon@google.com, dhyun.cha@samsung.com,
	kn_hong.choi@samsung.com, mankyum.kim@samsung.com
Subject: [QUESTION] arch_counter_register() restricts CNTPT access when
 booted in EL1, even if EL2 is supported
Message-ID: <aCbhBttvi8mvsyGE@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTvfLfbUMg6/fuC2u7Z3IbjHvs6zF
	6wu/mSya9l9itjh/cDq7xdXd75gtJkzew27xu6mZ1WLC+82MFpseX2O1uLxrDpvFtWtP2S2W
	Xr/IZLFzzklWizObtrFYbN40ldmi/edrFgdBjzXz1jB6LNhU6rFpVSebx51re9g83p07x+6x
	eUm9R9+WVYwenzfJBXBEcdmkpOZklqUW6dslcGXcP3uHsWCXUMXkAyvZGhh/8XUxcnJICJhI
	XN95hb2LkYtDSGA3o8S6J3/ZIBIyErdXXmaFsIUl7rccYYUous8ocWDKayCHg4NFQFXi0i5z
	kBo2AV2JbSf+MYLYIgJzGCW6FpmA2MwCN5gkjk0oBbGFBQol1s9aygxi8wooS3yZ1wRlC0qc
	nPmEBaJeXeLPvEvMIOOZBaQllv/jgAjLSzRvnc08gZF/FpKOWUg6ZiF0zELSsYCRZRWjZGpB
	cW56brFhgWFearlecWJucWleul5yfu4mRnCUaWnuYNy+6oPeIUYmDsZDjBIczEoivNezlDOE
	eFMSK6tSi/Lji0pzUosPMUpzsCiJ84q/6E0REkhPLEnNTk0tSC2CyTJxcEo1MMnkzvu3Tdrw
	47+nt09mh8a0fRN99M0noKdzlcG6FIdriimCdvlWZewX61/NLAvtKmRS8fKfc6TjU8m5JRJH
	HhlcSUnnblhl9GerjG/W9Mei/u48ndulGAOP3oyQSfr5M02WIf5k0Pkb7OJl+7oCYkMfqwWc
	eNlzrmjn5Adyydf+MX4P2Pw14KiRj2SjlslT24285UsuabRl8/aICG0RXbZ4c3UOt9Rs3zs1
	L8Sd1zBX3p25TGhOyqKcHd1LHrNJOxkzvmu1erhOzeUWC2uqo2y2oZk62+moZ1mzrBZnn3Po
	8ev/JCEedKHml2ZNb9LtDp60f6lvyqtNV/900u1yeaPH/Crp2Y05F/NnVj9TYinOSDTUYi4q
	TgQAMVcUdCEDAAA=
X-CMS-MailID: 20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----.cKlolkxedMLVDWcgmrm8Gdt3k.eYqjXC2h.qDwGQioKViW9=_56d50_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770
References: <CGME20250516064924epcas2p24c8f3dc1860768b2b7bed30a41528770@epcas2p2.samsung.com>

------.cKlolkxedMLVDWcgmrm8Gdt3k.eYqjXC2h.qDwGQioKViW9=_56d50_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Hi arm arch timer experts,

While reviewing the arm_arch_timer code in Linux 6.12,
I noticed that the function arch_counter_register() restricts the use of the physical counter (cntpct_el0)
on systems where the kernel is running in EL1, even if EL2 is supported and cntpct_el0 is accessible.

In our case:
- We are not using pKVM.
- The kernel is booted in EL1.
- We disabled VIRT_PPI and explicitly selected PHYS_NONSECURE_PPI for the timer refering to below code.

static enum arch_timer_ppi_nr __init arch_timer_select_ppi(void)
{
	if (is_kernel_in_hyp_mode())
		return ARCH_TIMER_HYP_PPI;

	if (!is_hyp_mode_available() && arch_timer_ppi[ARCH_TIMER_VIRT_PPI])
		return ARCH_TIMER_VIRT_PPI;

	if (IS_ENABLED(CONFIG_ARM64))
		return ARCH_TIMER_PHYS_NONSECURE_PPI;

	return ARCH_TIMER_PHYS_SECURE_PPI;
}

Despite this, the `arch_counter_register()` logic selects `cntvct_el0` unconditionally
due to the `!is_hyp_mode_available()` condition.

static void __init arch_counter_register(unsigned type)
{
	u64 (*scr)(void);
	u64 start_count;
	int width;

	/* Register the CP15 based counter if we have one */
	if (type & ARCH_TIMER_TYPE_CP15) {
		u64 (*rd)(void);

		if ((IS_ENABLED(CONFIG_ARM64) && !is_hyp_mode_available()) ||
		    arch_timer_uses_ppi == ARCH_TIMER_VIRT_PPI) {
			if (arch_timer_counter_has_wa()) {
				rd = arch_counter_get_cntvct_stable;
				scr = raw_counter_get_cntvct_stable;
			} else {
				rd = arch_counter_get_cntvct;
				scr = arch_counter_get_cntvct;
			}
		} else {
			if (arch_timer_counter_has_wa()) {
				rd = arch_counter_get_cntpct_stable;
				scr = raw_counter_get_cntpct_stable;
			} else {
				rd = arch_counter_get_cntpct;
				scr = arch_counter_get_cntpct;
			}
		}

As I understand it, `is_hyp_mode_available()` checks whether the kernel booted into EL2
— not whether EL2 is *supported* by the hardware.

Therefore, even on systems where EL2 exists and `cntpct_el0` is accessible from EL1,
the kernel still forces the use of `cntvct_el0` if the boot EL is EL1.

Is this restriction to `cntvct_el0` in EL1 an architectural requirement,
or simply a conservative default to avoid possible traps on some systems?

If the hardware clearly supports EL2 and allows CNTPT access from EL1, could this restriction be relaxed?

Any guidance would be appreciated.

------.cKlolkxedMLVDWcgmrm8Gdt3k.eYqjXC2h.qDwGQioKViW9=_56d50_
Content-Type: text/plain; charset="utf-8"


------.cKlolkxedMLVDWcgmrm8Gdt3k.eYqjXC2h.qDwGQioKViW9=_56d50_--
