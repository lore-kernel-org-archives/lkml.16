Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241EB111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067781; cv=none; b=Ne7jk0a5LKpl+QHCBbK1lynhkyosOzOHlLO6P06Lm8GTf15C7vL8TT49+my6FFc4VUWp269BPqT2KR56viAPawo1yMM+AmRtlZxcE544hHc+GQ2Z/SeUdwGZriKKoQH1RRIZSkCP+Gul9fM8VybWJSkvxVEH3on9zDBvPkFSbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067781; c=relaxed/simple;
	bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erFL1KX4TpkrU9XWguO5e+q/sVAMtK5WGnBzcJA2PEkYixmcW4YE1e+u+E+a51p729Xc5NZMrBjv0I6lT35rYNd9+qPL1YZpZmm3c+gBmbdplFSQnxc0w0cJy/0HBiDm8Tx9aXIbwNvKerEcKDeX5CTJLDHze26WEIQC01tDXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLjgNwuA; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLjgNwuA"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7387d4a336so284871276.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749067779; x=1749672579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=;
        b=RLjgNwuA3ZgsuSvwW5ct0y9YJXa0aPW3Lux67O6T5yZZ0Nn7Mo5gUQLfCr78PV3nJI
         bgUcCGQIcHLOqjbpxz/mjleI987S2mgL1XkFxg9h61LQVejQuQ+VOWKH8aPHfHluvyzM
         zsyxMpaJy0VHmlw/vxkplZA5cKosTYTaRmfLU1Z/VXUX4WQs+8TKtb9LbUJuVOz82tNQ
         ah83EI+MRPb2p2kaPq0HRm7cDZRUgnexOaAMOsLekTU5ASPcf2mLTl38mhaUcZalkCrl
         ghP+8MKqjZPJoMRvZPCjjHNqCBB3LBGEdoDZfNqsiwNtc1haUOjHpYRUehH6Zv62dVlX
         V6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067779; x=1749672579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+9cioOEbudhepUywjfVI9ITBQV/u+Nkg6uYOHe/678=;
        b=fpOALf7TlK7BDWfIKhSvXg12vUoAZVwcKGauAbpF129FNGK6xGDXRN0anaRBuRR8J9
         cEKrH79pxGEu1HMhCEOTa2azUGJ2Dh1YQdIB5lhPPVMClOmWPpW55mfARJNFGGX2OO+O
         LT6K9Qr8SvuiXSKd8tBEOgQ8riZYGXKrLkKmbQU34rRi+JL3yCCWgc555Km/TxWzw4EQ
         BpW+Ja9+OfC52CQW4ihYCWSz7xez1IX0uckBMsjWW2uTri9+Fc3nVsk6RALOcjBEiXKX
         AiJzPiQ0ASMnvwbIcLmYa7C0tKO4JBjOcF5NaWTe8xD0wj+cxcRXuPZK+GW2pS4cpC5/
         koWw==
X-Forwarded-Encrypted: i=1; AJvYcCXULyaHMFEBtno8Wgvc96UOR9YgMd6PFMWqkFM8qUdnwrKlW0XU/oLOAnm6v0jdnxgewawxOD62ROenoII=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xchOwAJ7U1T7rHIU06KFXy40sOsNGqTSgHVScFtySe1qtmfi
	hD7Lkhx0EdBUgitg6Tfjk+m3gKebJTOMl6PCzOEiMdF9rL3jfjfpOEsooIju7OFhLbQVcOEmWEx
	+Nbj08Wqv8H1e6ldDsp+M5SltXze80a/2chffJ/ezwU2VovBBgFYk
X-Gm-Gg: ASbGncusVi4+ekmdVQPNVtznx7uptStfuXkE6Q+nV8i/jQ9msuSyhTA7aF3HJ5ZB5KW
	wjegk0WaZDGuDK3zG6EuXzh3Jyea8zpmH8AUoIbsJfUu/6JZyjtFnrqnim7O/Y7nu0ze6B20Hl7
	sBiIHdwBJ8DD1HQudPcsotK+ZEdHO78WOreQ==
X-Google-Smtp-Source: AGHT+IFfyHVpl5KOssQDfj1VF9PKEb6eRaVwPXBHdJuglfUTXJlEBLRN4J2v8X9ZotLnlmipHWNU4MoJGSrUZ7zPwjA=
X-Received: by 2002:a05:690c:4b8a:b0:70c:a854:8384 with SMTP id
 00721157ae682-710d9df47fbmr63637507b3.11.1749067779039; Wed, 04 Jun 2025
 13:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi> <878qm7ec19.wl-maz@kernel.org> <aEB10JC1bwwOJfWh@lpieralisi>
In-Reply-To: <aEB10JC1bwwOJfWh@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jun 2025 21:09:27 +0100
X-Gm-Features: AX0GCFumJ6vnRiYJlX3zD1JbrCnyiM_8nPMgYGa3ClGdrZqd-3fF2TLHNRUNxvs
Message-ID: <CAFEAcA9xBJiRQ+UMvyOSOqOwMPYrjja0Vhk8j4_0V7f7_0ETtg@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, andre.przywara@arm.com, Arnd Bergmann <arnd@arndb.de>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 17:35, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> Can I ask again what:
>
> status = "disabled"
> secure-status = "okay"
>
> for a device means in practice in the current bindings ?

From software's point of view, it means "if you're NonSecure,
ignore this; if you're Secure, feel free to use it".
From the point of view of something creating this DT node,
the usual reason for setting up a node like that is that the
device is only present in the Secure memory map, not the NS one;
so marking it that way lets you tell the S firmware where the
device is and also tell the NS kernel to ignore it so it doesn't
try to probe for the device and fall over when it gets an exception.

> When I said "a separate problem", I meant that, extending secure- tag
> (that applies to the "status" property only) to cover other PASes is
> independent from the GICv5 binding *if* we define, for a single DT an eg
> IRS device per-PAS (with realm-status, root-status, describing what the
> reg property represents. Is that what secure-status does today ? Does
> it say "this device MMIO space is secure-only" ?).
>
> It does not look like there is much appetite for tagging the reg
> property either and making it GICv5 specific is a shortcut IMO.

I think something GICv5 specific is not unreasonable.
secure.txt is careful to define the general principles of
how the naming scheme works but then to restrict it only to the
specific cases that we've blessed as OK. I think that's worked
pretty well -- it's fitted the needs we have and the GICv5 is
only the second time in a decade we've had to revisit and say
"we also want XYZ" (the first being /secure-chosen/stdout-path,
in 2018). I think that's a pretty decent track record. In
adding whatever we want to do for GICv5, I agree with Rob
that we don't want to accidentally open the door for more
general use of secure-reg or whatever on other random devices.

thanks
-- PMM
