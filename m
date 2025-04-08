Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A911522DFA4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150419; cv=none; b=pgOjJQjZZC27ZEf977l7VdqSjkpp9bMH5yohuABe3WPLQdszfvTeRMjAh0YN1VEGko01mGrQbOvDL9YKs6y5giW7l7m2hULA6sdOMyJhq9EFv5Qz0XszFgDxeEOLGcFD0skA9fjJNyigbGBf8QavykWGwiKbtsZl2dc3KaRmWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150419; c=relaxed/simple;
	bh=jPD8xL4r3I0NkiEqxms4CcN1PxB+AEbH5+jWhk5066U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=L10Jpk3PR+u6rZy7UqmWMy44r6uExynxf5BRAPpl1qixg0LNSzLkYWtspdOyTTDzecXbEFPgLkv/YnnR+J23zCfrI5o8HLVXs4jkbZJ7QLlYjAiODwzZIZx6EDWGrbX5QFL3DaSyevzAmr7glkO6YWj6Cmjpo4QupSyUKVOMlQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Tq/1zFm5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Tq/1zFm5"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250408221328epoutp01bcc3b4d59c6f5778fb15d86a391411b7~0d45IDB2K1407114071epoutp01G
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:13:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250408221328epoutp01bcc3b4d59c6f5778fb15d86a391411b7~0d45IDB2K1407114071epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744150408;
	bh=98nLlPYT+VTzspfa339eHkagfVUGyHyGGsVV5kY2nSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tq/1zFm5e6HXdip/B1Uqg5Q5mO9QC52Stzg95+Fw8Gs0Xgllmd6ZgUJMFEZjsghNC
	 uIWWFPKj7aRS6iahiv/ln0fyFJqJCJAWnvvZenA04F/A9ZjfDB8vLby5f9e979UaBA
	 /tYyjzroN2YZ+C4SJWGUg9Tzy/bbZyiCsaP68mmw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250408221327epcas2p4d4199845dd58741a72b446173060bd0a~0d44YY62L0708307083epcas2p40;
	Tue,  8 Apr 2025 22:13:27 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.97]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZXL1z1l5lz3hhT3; Tue,  8 Apr
	2025 22:13:27 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0D.FD.37303.78F95F76; Wed,  9 Apr 2025 07:13:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250408221326epcas2p24b455e5a9f65dff52807a3a0010eff9a~0d43GJ9xt1382213822epcas2p2M;
	Tue,  8 Apr 2025 22:13:26 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250408221326epsmtrp15bda4a714b1657db260153597e377797~0d43Fb2SQ1774717747epsmtrp16;
	Tue,  8 Apr 2025 22:13:26 +0000 (GMT)
X-AuditID: b6c32a4d-541ff700000091b7-34-67f59f87d99c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	51.41.19478.68F95F76; Wed,  9 Apr 2025 07:13:26 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250408221326epsmtip184585f5a670a2dd4bd418068c2ee1230~0d4229ybz1185811858epsmtip1E;
	Tue,  8 Apr 2025 22:13:26 +0000 (GMT)
Date: Wed, 9 Apr 2025 07:11:47 +0900
From: Donghyeok Choe <d7271.choe@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan
	<saravanak@google.com>, Sudeep Holla <sudeep.holla@arm.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com, joonki.min@samsung.com,
	ne.yoo@samsung.com, Donghyeok Choe <d7271.choe@samsung.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <20250408221147.GA2187207@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250408-transparent-daft-dog-ec2a74@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmuW77/K/pBrv6OC2u7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWqx7HgXq0XXob9sFstP7WCx2LxpKrPF8bXhFh1H
	vjFbLD7wid2Bz2Pb7m2sHmvmrWH0WLCp1GPTqk42jzvX9rB5vDt3jt1j85J6j74tqxg9Pm+S
	C+CMyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAbpc
	SaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeXWmJlaGBgZApU
	mJCdMetcD2tBi3LFzx17WRsYl0h3MXJwSAiYSJxabtTFyMUhJLCHUeLan/2MEM4nRomfSyaw
	wTkzf09l6mLkBOt49mADO0RiJ6PExdd7WSCcp0DO4sXsIFUsAioSpze8ZQSx2QR0JSZ1bmMD
	sUUE1CWWnN0CFmcWeM4s0fCmEuQOYYEoicftcSBhXgE9iTl/FrFB2IISJ2c+YQGxOQXsJdrn
	zgVbLCFwhENi64TZbBAXuUgcftcFdZ2wxKvjW9ghbCmJl/1tUA3NjBKTbrxmgnBmMEpcmfwZ
	qsNYYtazdqiLMiSuntrJAgkZZYkjt1ggwnwSHYf/skOEeSU62oQgOlUkzvc9YITZtWHuW6iJ
	HhK3T59nhQTKa2aJn21TmSYwys1C8tAsJNtmAY1lFtCUWL9LHyIsL9G8dTYzRFhaYvk/DiQV
	CxjZVjFKpRYU56anJhsVGOrmpZbDIzw5P3cTIzhha/nuYHy9/q/eIUYmDsZDjBIczEoivG8n
	fkkX4k1JrKxKLcqPLyrNSS0+xGgKjKuJzFKiyfnAnJFXEm9oYmlgYmZmaG5kamCuJM576OPT
	dCGB9MSS1OzU1ILUIpg+Jg5OqQamaJXPiz6dnxSwhLkmLlx44eoZFRy3amSWC4pwXPXe5+k+
	ZUXOW+5/k/IOPrQ43qi4ImZ1W+a1F+84nfJk2D82xh6/e+9NrOJkieMctfsFuy9MM//9XCB3
	ntuZY1/mXK63urtycsXThV0b3Rf3n1JUk684sm03kz/jbP0tTnz2/4zfmj+4UzHn/LonodH7
	rsSzfnLvq7bd02j45vk7of8Ore+kVQtvJeWYfnjMHrG6Sl+3I+ANS+1tqcquP4odK++wHTu1
	5k25+0Nm29kP1a77sW32nXy8XHlx7Bw1vpk7/tS+azq/Kt7g31FbL/nZe3vPmyy3nHVqgkDY
	I24X53jzv5MtmuytF9w/fEg7TvbnZyWW4oxEQy3mouJEADxurJJhBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSnG7b/K/pBhfniFtc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZxWWTkpqTWZZapG+XwJUxdeUdxoJlChVvLm5kbGB8JNHFyMkhIWAi8ezBBnYQW0hgO6NE
	90EHiLiURPuWmUwQtrDE/ZYjrF2MXEA1jxkl2npOgiVYBFQkTm94ywhiswnoSkzq3MYGYosI
	qEssObsFLM4s8JZZ4umMABBbWCBKYs/baWC9vAJ6EnP+LGKDGDqbWeLn/nvMEAlBiZMzn7BA
	NKtL/Jl3CSjOAWRLSyz/xwERlpdo3jobrJxTwF6ife5c9gmMgrOQdM9C0j0LoXsWku4FjCyr
	GEVTC4pz03OTCwz1ihNzi0vz0vWS83M3MYIjTytoB+Oy9X/1DjEycTAeYpTgYFYS4X078Uu6
	EG9KYmVValF+fFFpTmrxIUZpDhYlcV7lnM4UIYH0xJLU7NTUgtQimCwTB6dUA1PZlYSbdYEh
	fjmH1HbFW67mXbTELFvUyXDFkytea5f07bw74QrfoV1cLgt/qeSv2Ze63uqB+r7LF5jqBU/c
	vb64KP7845cH93L43C0Le7Ol9ebDN3UhX69/m8DktTA+zvaDfZbsHH++3MOKnYXPJ/a2zphh
	MU1NW4BzuoGr2Nkz9+X+mXj9Ub4htqhd+fHnM2+br7JeWfv/icFKzYpQzvzG+Cns/LvO/Pey
	l/fdbntkuQ/HWR6LtIZF8466hbeeLrtQebDB4s4cvz9+obza827xT75xn2G38ssfuTs8p++1
	8jG2MUyu1Hif+ddUY9UWQfs8zbJY2eeVTkdb85T6sjMVfqo8vWZ9+G/IO5ZzT7SUWIozEg21
	mIuKEwFvcbiBKwMAAA==
X-CMS-MailID: 20250408221326epcas2p24b455e5a9f65dff52807a3a0010eff9a
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_baefa_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250408221326epcas2p24b455e5a9f65dff52807a3a0010eff9a
References: <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>
	<Z+3kwsesiXyC0hbO@perf>
	<20250403-rare-wasp-of-management-9bce59@sudeepholla>
	<20250404041323.GA685160@tiffany>
	<20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
	<20250407225146.GA2858456@tiffany>
	<20250408-transparent-daft-dog-ec2a74@sudeepholla>
	<CGME20250408221326epcas2p24b455e5a9f65dff52807a3a0010eff9a@epcas2p2.samsung.com>

------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_baefa_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Apr 08, 2025 at 11:46:40AM +0100, Sudeep Holla wrote:
> On Tue, Apr 08, 2025 at 07:51:46AM +0900, Donghyeok Choe wrote:
> > On Mon, Apr 07, 2025 at 10:17:43AM +0100, Sudeep Holla wrote:
> > > On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> > > > On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > > > > /me more confused.
> > > > > 
> > > > > Are you saying you have some cpuidle platform specific logic inside
> > > > > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > > > > trace the entry into the state and nothing more.
> > > > 
> > > > If you have any further questions, feel free to reach out.
> > > > 
> > > 
> > > I was trying to understand the difference in behaviour between normal
> > > cpuidle entering the same deepest state that is entered in s2idle state.
> > > I assume GIC doesn't loose power and no need for GIC ITS save/restore
> > > in normal cpuidle path ?
> > >
> > > If so, what triggers the GIC suspend in s2idle path if syscore_ops is
> > > not getting called ?
> > >
> > > Why would the firmware pull the plug on GIC ?
> > 
> > The GIC loses power. It is powered down to the same level as during suspend.
> > Therefore, it became necessary to perform GIC ITS save/restore through
> > a method other than the GIC ITS syscore path.
> > To help with better understanding, I will write a pseudo code.
> > 
> > void mimic_syscore_suspend()
> > {
> > 	/* Perform the actions required to power off all cores. */
> > 	...
> > 	its_save_disable();
> > }
> > 
> > void android_vh_cpuidle_psci_enter_handler(... bool s2idle)
> > {
> > 
> > 	if (!s2idle)
> > 		return;
> > 
> > 	set_cpu_powerdown_mark();
> > 
> > 	if (cpu != booting core)
> > 		return;
> > 
> > 	/* only booting core here */
> > 	mimic_syscore_suspend()
> > }
> > 
> > void mimic_syscore_resume()
> > {
> > 	...
> > 	its_restore_enable();
> > }
> > 
> > void android_vh_cpuidle_psci_exit_handler(... bool s2idle)
> > {
> > 	if (!s2idle)
> > 		return;
> > 
> > 	if (cpu == booting core)
> > 		mimic_syscore_resume();
> > 
> > 	set_cpu_poweron_mark();
> > }
> > 
> > All cores will be marked as powered down when the HVC/SMC call for
> > CPU suspend is invoked. When all cores call the suspend function,
> > the firmware will recognize the powerdown mark and transition
> > the system into suspend. At this point, the entire GIC will also
> > be powered off.
> > In a cpuidle situation that is not s2idle, the cores do not mark
> > CPU powerdown, so the GIC ITS save/restore operation is neither
> > performed nor necessary.
> > 
> 
> OK, I understood. In short, you create problems by hacking up or misusing
> your trace handlers in ways it shouldn't be, and now you are t/crying to
> solve those problems.
> 
> > > Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
> > No, there are parts of the GIC that require secure access, so the
> > GIC save/restore is performed by the firmware.
> > Since the GIC-ITS is entirely controlled as a non-secure IP,
> > I think it is more efficient to perform save/restore in the kernel.
> > 
> 
> I can understand that part, but my hacking up things the way you have
> shown above, though you may think you have achieved some feature very
> smartly, you have just dug up the hole with issues you are facing now.
> 
> The only reason IIUC s2idle info is used is to identify when the RPM
> is disabled. You are using that info to manage GIC power state.
> 
> The CPU deepest idle states entered in the normal and s2idle must be
> same. If you want to still achieve extra power save with GIC powerdown
> make it completely transparent to the OS.

First of all, thank you.
You're clearly pointing out the painful truth.
I’m well aware that this approach isn’t ideal.

Following your advice, I’ll do my best to keep things
as clear and transparent as possible.
My goal was to explain the situation we’re facing, and I feel
like I’ve managed to do that — so I’m glad about that.

Best regards,  
Donghyeok Choe

------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_baefa_
Content-Type: text/plain; charset="utf-8"


------JAxyHCgdtJ96A8.Ok.gYWmZQmsTOHaTnMoXq.aDuWNAvXzgf=_baefa_--
