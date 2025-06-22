Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8FF163
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750621528; cv=none; b=MJeRbMdRt0EVgRhuPJcNui98/I4Ma16q43aMCHTsjFJOxdm9GxuRopPEGDXOV9O4USPs8Xidmd8S71DC5AKHI4PXEKGSmfZ5PsEVZqYSwLrAfhgFu1YXtaGG66+NWAns/LuRCTAkV+HQSuPh6hT6Lx7OnvpqUgh4KGikk09VCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750621528; c=relaxed/simple;
	bh=xMl0gncXwfJpbyLYubw2FwsDgOENBfjuqAn9J+V6JDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGQxj0i9ZlCcBYICZ5Pw4g5i9/FU4Uv+346o0/uVpMx80X/znm+owsYt5nhNFh91VubZt3Y62dbhwyZFl38uxWQgIi83NWY4G0chVkBkxpB+zyPMjp8y2lgzrROLqO9czGMlrm8ks9WEJZMw2tl9mlPgZWh80q76FyOrItdxMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=tometzki.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=fLPprGzM; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="fLPprGzM"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7f38440fcso879743137.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 12:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1750621525; x=1751226325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ChgWC+3ezS/6tB64iTOn4h92WPPY7VUopVU/jQD7g8=;
        b=fLPprGzMxYo4Eqc0hs5/jkf+kf5NVj7CMLYdZTBTrcYjGHDLddD7+Fm9pDyqNbSCwU
         eJUpv1P4WBOEUzGroK/XWcyXv0xt4Zf9ac2RkvWVLJLyVWVtT1zl/DBROoZBKYOn+0FE
         AzXnQ5zhOypQ2VdqC47aObBbs47IA9qIRDM5LsryGHbH4wvE37WBAX6eAQ6WBcSd1Gkp
         tem3mYujMtgrMX/J3N5tqkgXgQ83lhBWrU9ckOw5ROy0enCXQe2DsV3mlAeCzm546OLT
         IqRLq9FEAgWshAO4jPJ5ANX3gxXx9Mhbuohc5BkI6EjvC8GxM4zXXTi5rVNgOOJevfJy
         ADNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750621525; x=1751226325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ChgWC+3ezS/6tB64iTOn4h92WPPY7VUopVU/jQD7g8=;
        b=AfOwdIUP3piDshC4KmBV7d42tY+b67XguOJvbZ7ZvEFry0OoRscXR29XasP8eiPE82
         //R20QGfiXruoZP1HmvfgEAbp1KA/DEB6Nrm3Jw0ViOArHZYtEC88VAuLzUR22cPJihf
         9IMSTYQ7pz5Ka9yJfKMaUcFsr29eOAJWXkw6mGsUGdsD6VQlqEj7n9N57kraJGLfDmJX
         yjw9M8vqhWDu0AxI/OlhmGTRUQ6idjQxodpR4HDgjiB+t16Ka9qX5tyR4OHEZfXJKJYc
         78yPw4ALO2DJhg7+k8Feyx61zc6QfYzrwdgkNEssLYzhMIZpdXFSVufOzLxZ2oKx6D92
         ZCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv6TI1KIngAs2y+BbF/q8fbvQFa2Oddxx7iGDeF/D9TEQGg2pSR7mQV6Ey4gIp2sKJ+BTdEpTtHwTr4M0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZ64KYJ1XmR1NlUu+RQQk460yAfQQpE6mM7qsFrN++/l9d2sB
	vp0oFoUAbnSLMVGz6fkdH78WFFssZ29oRwp9P1qa4TeJ02Q2b1xeWieBqY6qkKbDktE9qThmEim
	dDe9kDyzcZrT4FXUossW0IgK6yhRaGe7PY4knnZ4BjQ==
X-Gm-Gg: ASbGnct6RtVdjEB0aLDeVrqzZ17mexVzyQg74LXzZJUiDAVt+/H89ol6FSwuwGxMgog
	5um3VgzMz3dyDM6lMzAMVhrnhSavCJWLj3W+8qArWemu9hIuzcq1mX+js0SrM1xFcsY2+0Xv+50
	4APAcHJ0nTn3uB6O/K6leDb3y3NpiXUEw4x2u38Jt5rwqzpeGhE5zN/JYTCLePjUAbMU+Tz9c9A
	4KCZFV98fUZnw==
X-Google-Smtp-Source: AGHT+IG1ytte1PKWUtJPyzMDnukdyiPq2U8ipMkApBgqIsoHE7yQfT6CIobEIp92dXYY/EarclIJC5CZptO2BDJpGP4=
X-Received: by 2002:a05:6102:2ac9:b0:4e7:bf03:cd79 with SMTP id
 ada2fe7eead31-4e9c278f547mr5663013137.5.1750621525576; Sun, 22 Jun 2025
 12:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFgvmhSbup2BnUHu@fedora>
In-Reply-To: <aFgvmhSbup2BnUHu@fedora>
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Sun, 22 Jun 2025 21:45:14 +0200
X-Gm-Features: Ac12FXyOU_bdBPqnMrGIUvjiVObxa6euaNtZ5QVxUNDgfEL_cn5TDfels2jU9WI
Message-ID: <CAL=B37mqrHOzEQzPX3=6S5XaUZexYRUXNBgUuGsiX6+4iHWO8g@mail.gmail.com>
Subject: Re: wlwifi AX201: WARN_ON in iwl_mvm_mld_mac_ctxt_cmd_common repeated
 UMAC FW crashes on 6.16-rc2
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 6:30=E2=80=AFPM Damian Tometzki <damian@riscv-rocks=
.de> wrote:
>
> Hi Miri,
> Hi all,
>
> with v6.16-rc2 I consistently hit a Wi-Fi firmware crash on a
> Lenovo ThinkPad X1 Carbon Gen 9.
>
> Hardware / FW
> -------------
>  * NIC  : Intel Wi-Fi 6 AX201 160 MHz (PCI ID a0f0:0070, rev 0x351)
>  * FW   : 77.864baa2e.0 QuZ-a0-hr-b0-77.ucode (auto-loaded)
>  * BIOS : N32ET96W (1.72)
>  * Platform: 20XWCTO1WW
>
> Kernel: 6.16.0-rc2 #440 PREEMPT(lazy)
>
> Symptoms
> --------
> Immediately after NetworkManager (or plain `ip link set wlp0s20f3 up`)
> the driver warns:
>
>     WARNING at drivers/net/wireless/intel/iwlwifi/mvm/mld-mac.c:37
>     iwl_mvm_mld_mac_ctxt_cmd_common+0x175/0x1d0
>
> The firmware then aborts:
>
>     FW error in SYNC CMD MAC_CONFIG_CMD
>     NMI_INTERRUPT_UMAC_FATAL
>     ADVANCED_SYSASSERT 0x20103126
>     Microcode SW error detected. Restarting 0x0.
>
> The cycle repeats every few seconds; the interface never becomes usable.
> Full dmesg attached.
>
> --
> VG
> Demian Tometzki

Hi together,

I identified commit 83f3ac2848b46e3e5af5d06b5f176c as the cause of the issu=
e.
After reverting it, the system is working again.

Best regards
Damian
