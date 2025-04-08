Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6CA47
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151434; cv=none; b=Qui4c5pnHynRmsja+8eXhlubpkw8BPVkAZmD65klgIGeuwYZnyk/eXGRIGpgVZZkrH0gq2iMGwV4AEclo6aw8VInoLtI173XI1VfMPoLgOEjd+QT+rorbZmZR+0g3tMsA8CB+R9yWB54AiU37jvtGqmQ/rK/KxKcmlVmD0TNLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151434; c=relaxed/simple;
	bh=6iEtmnVy9/oNTMwUdmLOb5G3rvwQgHWh8nU4u7+JlJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=jhqneI/ETz0VHwTHRS0gHpENF62tAvYAc7CIbKeRfFqDt8ItH/SiDosSdWhcuOLJhVE4x5ZfgG67Yl9KNaS/NpTbOB1ZYfrurk6+i2KGjDxg/Goou/47f5RfRIbR27egBLfYDoJ1uo/j5h+z4bFJmNgjXaIGOi6O6oDHTOTcwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O54uKXsc; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O54uKXsc"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250408223028epoutp020019d0dab6e6939ad53d4bee3bc8a3b3~0eHvNbF461735917359epoutp02N
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:30:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250408223028epoutp020019d0dab6e6939ad53d4bee3bc8a3b3~0eHvNbF461735917359epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744151428;
	bh=daTWqN3jpxe4gC1xN/OLC1sxScqhKfxGORcCNJ0vXEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O54uKXscZZFj6S40bjZeiRkp9xtVaYplzZ0rjYc44afw6JGLy+MNK4KUuJLuHYDqK
	 HisCgC1y73+rZN+uvY3N1/HCTvJAhvPGApfB6DKOIV4mb0gjoRdcqEw7F7bFX6+eG8
	 Pl3pXZZLUZWhaJiv2AXo0aYXgRUtoYv7cfL/tVPg=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250408223028epcas2p25b57e53d0407f0b8150567e1286aeb93~0eHun056R1115911159epcas2p2w;
	Tue,  8 Apr 2025 22:30:28 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZXLPb3VQJz3hhTF; Tue,  8 Apr
	2025 22:30:27 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.E0.09787.383A5F76; Wed,  9 Apr 2025 07:30:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250408223026epcas2p220582f5c0401b442921cda2571c595ec~0eHtfGNlY1108211082epcas2p2y;
	Tue,  8 Apr 2025 22:30:26 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250408223026epsmtrp190cac27ccbda6e1095b0d3de9988e5fc~0eHtdet3W2762627626epsmtrp1L;
	Tue,  8 Apr 2025 22:30:26 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-d8-67f5a38312dc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	9D.C1.19478.283A5F76; Wed,  9 Apr 2025 07:30:26 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250408223026epsmtip179dd352b2cf00b65b0d651d4cc0deb9c~0eHtRIngR2246222462epsmtip1D;
	Tue,  8 Apr 2025 22:30:26 +0000 (GMT)
Date: Wed, 9 Apr 2025 07:28:51 +0900
From: Donghyeok Choe <d7271.choe@samsung.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vincent
	Guittot <vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	hajun.sung@samsung.com, joonki.min@samsung.com, ne.yoo@samsung.com,
	Donghyeok Choe <d7271.choe@samsung.com>
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <20250408222851.GB2187207@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <86tt6zkux7.wl-maz@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmmW7z4q/pBjsXi1pc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S5
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE74/zNxIIzvBVTdzWyNjDO5O5i5OCQEDCR2LletYuRi0NIYAejxLSGX8xdjJxAzidGiTv/
	kiASQPa9hxPYQRIgDb1v/7FCJHYyStyYPp0VouMpo8SVaREgNouAisSa1TuYQGw2AV2JSZ3b
	2EBsEQFFiU8XTjKCNDMLnGCWmDe9lxHkDGGBKInH7XEgNbwCehJ/5u9hg7AFJU7OfMICUsIp
	oC0x7WwJxNFHOCT+uEOc4yJxdet6qNOEJV4d3wJlS0m87G9jB9kkIdDMKDHpxmsmCGcG0JmT
	PzNBVBlLzHrWzghiMwtkSKyado4VYoGyxJFbLBBhPomOw3/ZIcK8Eh1tQhCdKhLn+x4wwuza
	MPct1EQPiXUTLzJCgucqs8T+64fYJjDKzULyzSwk22YBjWUW0JRYv0sfIiwv0bx1NjNEWFpi
	+T8OJBULGNlWMYqlFhTnpqcWGxUYwuM5OT93EyM4PWu57mCc/PaD3iFGJg7GQ4wSHMxKIrxv
	J35JF+JNSaysSi3Kjy8qzUktPsRoCoylicxSosn5wAyRVxJvaGJpYGJmZmhuZGpgriTOe+jj
	03QhgfTEktTs1NSC1CKYPiYOTqkGpj3/4v/+vHr93Rtx3d1pkaycfy8lKe7+ccdHjjvA58P8
	6UKv9QLdtCZPqpkt8dz/ld8f5rR7yc6s/zjyyr3fTotWDpvQfUjlcUyicIct36TVeZOuLLk/
	rWLT7OPf+k0vZavND362O6f9eb/bFI3U9N1eB/zPfDfSmt2ku3Lh2rmTunLElrzlOiSYqeH6
	Yz8fW3SYtEliypONtd82HfbZ9ih2RvRu973MQsHWHvNf1rg4nujenrRYfv0ah59ZP5UdZ0bv
	nepy7YGYht8u9k/imh+2if0XkeZ6PdHhw+Ibj784lMl4F/70nnwj+Z/H2zXOorPMovk9J6dx
	rfpn0pbrmdw4U13YTuT/2kfMjkn65kosxRmJhlrMRcWJAKgQJA1YBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWy7bCSnG7T4q/pBnOfmVhc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZxWWTkpqTWZZapG+XwJWxcv8atoJ3XBX7fjSxNjBe5+hi5OSQEDCR6H37j7WLkYtDSGA7
	o8TEGTNZIRJSEu1bZjJB2MIS91uOQBU9ZpRo/fMArIhFQEVizeodYEVsAroSkzq3sYHYIgKK
	Ep8unGQEaWAWOMcscfbqXmaQhLBAlMSet9PAGngF9CT+zN/DBjG1nVni8Pk2VoiEoMTJmU9Y
	QGxmAXWJP/MuATVzANnSEsv/cUCE5SWat84GC3MKaEtMO1sygVFwFpLmWUiaZyE0z0LSvICR
	ZRWjaGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcOxpBe1gXLb+r94hRiYOxkOMEhzMSiK8byd+
	SRfiTUmsrEotyo8vKs1JLT7EKM3BoiTOq5zTmSIkkJ5YkpqdmlqQWgSTZeLglGpgKpt1keuD
	1pSlXJNtAo7+bDle1Mj+0Ph31kqGyg4Rpl8lCfw9r/Wc+vvu7xM2tmaO+pjWHm379MTVgqCG
	+CbVb1O2eptx2mfITXOXsplcOfNckOqFv32Rs9fE8HaF3fbtvSh5LvQVW72PVOCr6Xeszp84
	6+Zh0hjwkyPpgjzHiudenVMdPePlfpavcVkbKlF/PcDwfRPXOv+DW3kyS/rTAmJabHKCuurz
	Jl0VcVmosMXojq4zd/qUvAN2W+1+ty/wtxDp/fVairdGlIXvvPji4DSB37mSuz582SVe4ur0
	ut7i5LmY/++DX/zRfZNmcV0i78OPEukPcVHCtwtj7jgcvnT7sjTz76dHp6gd+a/EUpyRaKjF
	XFScCAANXZsKLAMAAA==
X-CMS-MailID: 20250408223026epcas2p220582f5c0401b442921cda2571c595ec
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_bae2f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250408223026epcas2p220582f5c0401b442921cda2571c595ec
References: <Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>
	<Z+3kwsesiXyC0hbO@perf>
	<20250403-rare-wasp-of-management-9bce59@sudeepholla>
	<20250404041323.GA685160@tiffany>
	<20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
	<20250407225146.GA2858456@tiffany> <86tt6zkux7.wl-maz@kernel.org>
	<CGME20250408223026epcas2p220582f5c0401b442921cda2571c595ec@epcas2p2.samsung.com>

------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_bae2f_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Apr 08, 2025 at 07:51:32AM +0100, Marc Zyngier wrote:
> On Mon, 07 Apr 2025 23:51:46 +0100,
> Donghyeok Choe <d7271.choe@samsung.com> wrote:
> > 
> > [1  <text/plain; us-ascii (7bit)>]
> > On Mon, Apr 07, 2025 at 10:17:43AM +0100, Sudeep Holla wrote:
> 
> > > Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
> > No, there are parts of the GIC that require secure access, so the
> > GIC save/restore is performed by the firmware.
> > Since the GIC-ITS is entirely controlled as a non-secure IP,
> > I think it is more efficient to perform save/restore in the kernel.
> 
> More efficient? Give me *one* aspect of this save/restore sequence
> that is done in a more efficiently way in the kernel. Dumping MMIO
> accesses into memory has the exact same cost at EL1, El2 or EL3, and
> splitting things along an arbitrary line to paper over bad firmware is
> not a valid argument.

If I had to highlight just one efficiency gain — it's that I get to
reuse well-tested and well-written save/restore code without
reinventing the wheel (or worse, reinventing a square one).
And as for bad firmware... I guess it deserves the punishment
of handling GIC ITS save/restore.

That said, I truly appreciate your insight, and I’ll make an effort
to avoid relying on such suboptimal kernel usage going forward.

Best regards,  
Donghyeok Choe

------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_bae2f_
Content-Type: text/plain; charset="utf-8"


------ieZh69edyBxzv2Y5Ggo8207PwRbI2z7mQ5FWfU8PsFoZKj2n=_bae2f_--
