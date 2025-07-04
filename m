Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65B27F4C7;
	Fri,  4 Jul 2025 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614036; cv=none; b=EFrOUK16j1fxMMuMtc1NeDidvCdbHUt0Jc4OQ5eRV/3oKCPQ8HclDp+rrxz7/guoTEGmj9/9WzEP2a88NjXExsbsJ/EB7bJwENeIZWbwKXQVtJtTpVWGrYxIzqW4dVD/xkmRJuKJVq1qrFGRH8uyi9MH1PVFAW1Hre/okuSetmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614036; c=relaxed/simple;
	bh=APlujz3QqBIHliCa5cLij1ddIwxT5n25Q5hISvN8bJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX7t0KaGey3oCts82qPKk0tFok+XGGFfiS/RxhRnukNUcWpi8oQJMst1wxG1niibKJhueNRlX/qaYB2rKFvaYn5i/GE9aU5FwWuwMOio5ZJy3PZWL2DKihc/4idZxqZi4oLUjokde/P99cHZVZLh/OCuqvZLXhFsb63Y3F9Tfbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpgz9t1751613992t6c49a589
X-QQ-Originating-IP: NKnTRTQqlnTiWFdThzYKqoMVdamEtqPW1awdNrhl788=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 15:26:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2485475499401928861
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 15:26:30 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <021E47BD8882DB2D+aGeCJvwdYAs8pny9@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
 <6e209f3c-1d24-4669-8a51-3b651a28420c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e209f3c-1d24-4669-8a51-3b651a28420c@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MwFkbloawFgLe5s48+g8MFJ6b9xcuTIeCZD4OMBBYZa90d1lhtdTa4yR
	CYJU6An09Z+R8bYYIPHqH00xcWjgjd0e4onP/EQuHAEGjpY7avw5sY5UOOMr/1sjq9VpdQs
	SroY5VdWfdBUNpGFCsUo5X1/KIS+h4CksDJhLRe41CAWX9T0GeIBy/PUGGAI1UjCZBasgmt
	NtX5Mma+bOpxxtBbQXh5EgWVLEZJRLHMzbNo0YgA8EL+nGvHMymL2QBjU8LtKMKewtBnPG2
	kKNmTi8D8riV3HVxMp5ChZ+V8u3fifRyCNNXrrAA4NDAGu3JEdZaNaWYrphTSYKUguWPV1p
	PAkhz6Hb8KFAhmm1QAcjH5n9b2OtFowcqJPax+fzP032pYpCU2fasb8P+H/bffg1Ky/c4bT
	YduJPRiPAqWlOr649Pi8uj/s0sZdTltFmYRgdVRJBNFjSrRxHw9nafBCdeo0xLgmZn1wd4/
	oA8qGSwJuNYhfb4Plk9l26O6ovEMiqz3ao9+SdMVI5+N1FKSphqX9NQY78rE1tivRY66Nci
	dai+M0uCQXbmKkJ8Qm2NBbBfo/mD+mALBAjJIrG4dxv0MK4S87l3eD4Oi3AVQP6IcLVBl5J
	nlSN6rsse+kcZYhAnHabgOuuL6EaxlT9lZtSfdUzx4H7650FMtBJWwJUMtATYf9ErfoTNzo
	PpowqgE+SAHZ6JtGVU84PBlFOmiG+lxBLVDtdSah0Fsxg+e2XbDBVRbwK3dL1uR5EXjZLJ1
	Mh5gGhdw1wgfZwOEJtIGSi/jFQUxOYA1S/ZxnzQFr7SzpOXzF9QUztjLzNVOchJQA+X0K8+
	tXK2pCJBZEx8quzqaFOu6S5tGywwn+asdVmRh5n9PWNuJfuNxfYLVCysRF2lJZdTlQ8Tl3l
	M3Uc/XaDqEms8UWOkKUKn59pB4XQ/WMugeCbo9fl+glWaZb0uoFbHWv54RE9fN3XtU2eo9r
	VUNKCZZ6Jwx/d0/Lmc8SJLnD7AQuXxGo+kGOzIp8Y/IJWlFGqdrOdfnaezlA1CegXZaEn+F
	JtnzGjgpbK+jLrdhAybN5nD2FodKxdScybd41AnZ5mVASXQyyRsf1LFh2aXm2Vm/5JbIZ0J
	Rdc5ieOJgCyht9OUu8XcR3kvA00Scny2Z6hLEV5K5wUihwiCsggcbanFyAZX9NxZuvjXcsf
	7l/q+zClKquWsnixm//xDTOyEAj/uTuWv7/5
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 09:15:36AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 09:10, Krzysztof Kozlowski wrote:
> > On Thu, Jul 03, 2025 at 11:56:38AM +0800, Nick wrote:
> >> From: Nick Li <nick.li@foursemi.com>
> >>
> >> This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> >> which can support both I2S and I2C interface.
> >>
> >> Signed-off-by: Nick Li <nick.li@foursemi.com>
> >> ---
> >>  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >>  1 file changed, 95 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >> new file mode 100644
> >> index 000000000..3a1aba9b8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> >> @@ -0,0 +1,95 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> > 
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> 
> 
> One more thing: Drop "dt-bindings for" from subject.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

OK, update it in next version.

> 
> 
> ... and that was my third email today... I apologize I did not send
> these as one review email, that's not really professional from my side
> but somehow coffee did not work good this morning.
> 

Thank you for taking your valuable time to review the code.

Best regards,
Nick

> Best regards,
> Krzysztof
> 
