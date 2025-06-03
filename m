Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD29C72616
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915684; cv=none; b=Ey/X9f+/QV/OnT3JkCthsioe1uu7TIHATauwbbhAdGZlL7W+wxNJwpyZIiWQpbKX+I0xp3kPTeZf2vGo/T/NWfv7htE9SxXfFUEl0H45lo3Zzr4jkJDN1ittQZFMtspxdNSbSHP8iU2j3sTf9KFIJbVLCJAeqPRQRkrYVvoGth4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915684; c=relaxed/simple;
	bh=alGQUYdJ7trYc+bJw23IUMXpmOQ3ryN14Uf6s6Qh71Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=enrXa0maZWP6lcvDK4pOIuiy3xIj3QWu/IfHzj4BUC4UMUtVEAofyyij5Bop/7mwXFBXKctHdiy3ij7jOSmTrsB7PfPA57Ajpn7gPRZ7YGqlzz8/2emFeaJoGAAxhyuDfBKX77hMWIVqCxV81sXi7sUtajic3DaDNtIUP/355Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ta0WeT5i; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ta0WeT5i"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60be827f2b7so2767755eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748915680; x=1749520480; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pagyp+jy4clkriYFxGjoAVDUibh4LVZC+hrhARyI5s8=;
        b=Ta0WeT5iiQ5OH+9BslVuXv1ecPPVsP3FhBEpnD39kVZBmKeb0mKtMhhOh45+D58Hky
         sp26klPWJiVSoqGSrfZRPxWNJ3ZSPbZTlhFt2QNX73PsabJNiU5MVnGK6FaEG03H3n1M
         yN9f52EfE4xcZR4dLPS1NpNSCBF/dEusDWFsV11leWM2PxV3pYY20wisLpaGi3KkCNXo
         4hnaq4fPyFODSQdrglA8m2csnrnw7xoCogBrfZH3FO1b8EiiBf++2aQw7FfgYXAaYhJR
         oHO6N4u5nMq4gOlrBg60gzc0Xcfn+N2pJ5MShIq0KAbxtR9MYq521r37YiUYcPOfkNmG
         d5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748915680; x=1749520480;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pagyp+jy4clkriYFxGjoAVDUibh4LVZC+hrhARyI5s8=;
        b=D9VmanyafXtQA/DjnbNhtUQc2bFoN7zvWiVUWyhIBPIHT9LunACrKyK9pEj9aDJppk
         Wq2xXNgw7FDU0iuBlilxAcr41q+esyAhd7Vg95VKwZ29ZXtJ9KV+8mWtjbuNCKeZLGcp
         2exX3kGNyBAKH5V0XAXcW7rVY2BHjNcBS3K/yHDk04my5wTye9x4qOMV1fM49X0uS1mU
         LJ082gJNE33QcsBV6x/If53u/A1L5nBH0NIdysaDNeyG6OmwpzuNNnYyWRBABKEr5cHZ
         W/Wbv3OUqXnfTicBYRvwW/Pfq2KDRhpjw9a//zuv5FqT+zSgEK0A9dC4yLJMyXvK7Jq6
         E2eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw0m7HGl+F3pWSs14pQJ3t45KzbfdwH1wA0gdSnScGNMVgtUffHRBCj8MagjDE9tumKaU5Bdbng0eXK6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFReVxG1XhjLBnXonZ747lzqr0M9JweMzSBmFm4FxoMK/Jj4uu
	m2U27iMByAGAxfKiOywQOj2dIglJdsKtxI60ZdJM6rj2m5Ko4+othdfU3u4YokNvFd8zQZxVgP7
	e5K+pzV9Nnb5Bk66X7PxV4mhLOqiokEsnRR5ictLW7Q==
X-Gm-Gg: ASbGncvfZKuY/fmUXXrRtcCcf03T0Cmsg17b87ziri3Na9bWljIN5oxTrr2Awm3sx9W
	dxdfuTFXn/6rTYgGDvNLGkGQ92rZYuF22zFYLM0lTjzbLca8PiC2aEndrMqVbdUcBf02v3IfevY
	2KSRjZzUiEvwtpHNI/z9XRZqHJpHRfygabH5qLAc8=
X-Google-Smtp-Source: AGHT+IHokecYTXxG97x/iEYQEeVys4OUT+S2pF48txreKp9kEQYN3ckg6nwxD/UKwBZMIe1z4CBO6my3eb/78TGVGa0=
X-Received: by 2002:a05:6871:606:b0:2b8:608d:5dd1 with SMTP id
 586e51a60fabf-2e99e2b9aadmr335785fac.18.1748915680571; Mon, 02 Jun 2025
 18:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528062609.25104-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250528062609.25104-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 3 Jun 2025 09:54:29 +0800
X-Gm-Features: AX0GCFudggujZacN9nRMZj0f-WQ_kk_mz1M7j0wdjQFNq3HWDe6-bTmazI6qunI
Message-ID: <CAEEQ3wnEN0GVjmGTGoRa2eTGnKoQ2gp3okx8m_XcgiwMvGwzPg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] serial: 8250: fix panic due to PSLVERR
To: arnd@arndb.de, andriy.shevchenko@linux.intel.com, 
	benjamin.larsson@genexis.eu, cuiyunhui@bytedance.com, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, 
	jkeeping@inmusicbrands.com, john.ogness@linutronix.de, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	markus.mayer@linaro.org, matt.porter@linaro.org, namcao@linutronix.de, 
	paulmck@kernel.org, pmladek@suse.com, schnelle@linux.ibm.com, 
	sunilvl@ventanamicro.com, tim.kryger@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Gentle ping. Any comments on this patchset?


On Wed, May 28, 2025 at 2:26=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> When the PSLVERR_RESP_EN parameter is set to 1, the device generates
> an error response if an attempt is made to read an empty RBR (Receive
> Buffer Register) while the FIFO is enabled.
>
> In serial8250_do_startup(), calling serial_port_out(port, UART_LCR,
> UART_LCR_WLEN8) triggers dw8250_check_lcr(), which invokes
> dw8250_force_idle() and serial8250_clear_and_reinit_fifos(). The latter
> function enables the FIFO via serial_out(p, UART_FCR, p->fcr).
> Execution proceeds to the serial_port_in(port, UART_RX).
> This satisfies the PSLVERR trigger condition.
>
> When another CPU (e.g., using printk()) is accessing the UART (UART
> is busy), the current CPU fails the check (value & ~UART_LCR_SPAR) =3D=3D
> (lcr & ~UART_LCR_SPAR) in dw8250_check_lcr(), causing it to enter
> dw8250_force_idle().
>
> Put serial_port_out(port, UART_LCR, UART_LCR_WLEN8) under the port->lock
> to fix this issue.
>
> Panic backtrace:
> [    0.442336] Oops - unknown exception [#1]
> [    0.442343] epc : dw8250_serial_in32+0x1e/0x4a
> [    0.442351]  ra : serial8250_do_startup+0x2c8/0x88e
> ...
> [    0.442416] console_on_rootfs+0x26/0x70
>
> Fixes: c49436b657d0 ("serial: 8250_dw: Improve unwritable LCR workaround"=
)
> Link: https://lore.kernel.org/all/84cydt5peu.fsf@jogness.linutronix.de/T/
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  drivers/tty/serial/8250/8250_port.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index 6d7b8c4667c9c..07fe818dffa34 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2376,9 +2376,10 @@ int serial8250_do_startup(struct uart_port *port)
>         /*
>          * Now, initialize the UART
>          */
> -       serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
>
>         uart_port_lock_irqsave(port, &flags);
> +       serial_port_out(port, UART_LCR, UART_LCR_WLEN8);
> +
>         if (up->port.flags & UPF_FOURPORT) {
>                 if (!up->port.irq)
>                         up->port.mctrl |=3D TIOCM_OUT1;
> --
> 2.39.5
>

Thanks,
Yunhui
