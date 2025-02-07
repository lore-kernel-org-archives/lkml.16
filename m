Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315A18B476
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928002; cv=none; b=cQn1P1kL0ink4ypx+0ygFWVtfQaW2TdnPpoS/30esXrNSZ4szjQZEESdWpl930+67ayBnMVaDuTMkkihYRUnpUfApECOdsGfjLEIqRJqUUsk4vG4rU9weL4MLW23hnK8xxxZEzY2NA94T0OnB4UfWpb6ZuLdLdH6S9A0dq4IfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928002; c=relaxed/simple;
	bh=gXyzOqKS3D1cnSlPVTDsO6qfKTWoz+fkXi1nkJCtkxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1so5wvSF/shu0TST6y/DkUrHHHgX0oshBEQUDxVApZ5LYE4hafsvNdKmNu5J7mRTIRTSmi/UsJLzUYKutqqmhfVshEFte39Mk16o/0kpmXe3bmdADtx9bnkK/Q4Jnda/+lv8rnWjto2R4rJDxQUSAZYLdf/EEYLG0cMdZ6KSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Uy6s2/L/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Uy6s2/L/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso11573205e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738927998; x=1739532798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7L9kaIgPcRrnD7ClKXqIY9Z6L5Ed7fzm7AoWEXWMxcw=;
        b=Uy6s2/L/nSxVgpPkKYFBImLW//HCC/hQQ6E+x1bgSrQexqZ1uXtTOmm7FEojjiVKXo
         +YS3Uqjd4EDPA7Uny2axrfVcFVXX06e65XWW7udR8pq04R58ZdkX3hVlyV8lbA0GzNzB
         awWHIV2cIV0nBk0YQPWdmh6AV4EYja51NYy7R12Zk6beZNbuo75iugpKsUK0d1egszwK
         6Io1pdmvomGH23lvLPGzJbJc2WHuvi+v+ZLAS82YyE7q9T/MN/VaFz+CA5Pq8ulsXZuf
         yi+/waqOfL189LKnHnkhgUI2RFiVXMlDs/qtz4c9ptQ1Zt7Zz7cA76CnF70SJds2SUbz
         zGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738927998; x=1739532798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7L9kaIgPcRrnD7ClKXqIY9Z6L5Ed7fzm7AoWEXWMxcw=;
        b=YE7lN9ubad2PsqbfZybw4+HvJ73MnfiHEy6iwCswTNIVhr3SKOWnh4RJIpYrKeRWx5
         J6dj7QgD7W2seQ32acUhF7gadO9Q2s4DskEX6uxSeZxsTkxQFZvr1jhtNmP0KGXZw7nr
         u822RcFG41Cj6GWEQ9h1qIklYGW/Km1/QliTYP1SOPdHMxFXHTsKrTrPkCK72vNytgki
         tgSAoFVQ9ucJDoJtxVRqjecERgL027mUHBNbD89QJTbaFieO660wmMcle5EzvsnjEbTV
         pldnbtag++oFWj5O3zKaQeIZupcyig/xQonxb3Uu+oTxPHh87x+wqhgUv1ibPezc+AMS
         Zu1g==
X-Forwarded-Encrypted: i=1; AJvYcCUvlW3U8yESC4kBXnu/Thsna/o1tebF9CmesJJ8dA8NDOAAv6jgrUbkFnZosZH8ughBkXauCzbI9EaTuOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSciKhcgWlNDJub/m5ahJQvfyktts0Ip8curNa3zhnt2jv1Qfu
	dk3uYDUZTMQEWNF8abBn3i5FI+qcnUx4H6t0vJZfg+LNxt0lgWuoEnFw4cqhczY=
X-Gm-Gg: ASbGncsvpDosmE3LZLBbuBIsqV4i3ype01rsbewmRME1IXvbnsTsQrSGL/1Y75limwi
	UKNF0mKe5dixcdy0gJKAm4e0emBxO9uACfs98gdSQU8h1Vh6tyVvVgucilHkCCXtMDiSlb/mMgR
	N18sC9F5D1iE9sryEZffqAoyV2qUwdSYxIj0kxqupuzPaUUts+oPL8Xx9aUiksvLepMwHEjtYis
	D+ICs+UNaBthYlRhFTNlUjxmB9hFjJeV811e0NEewHIix+/pvSFc2nD6wJIH3hKnJPkJeUgHdkW
	x4udsUpylTdzUBJxEbz+dtAGPhMe7ORlr68MBWsDf5Q2jA==
X-Google-Smtp-Source: AGHT+IEpT1fcvjRNyGuoEMQnn+pd9SfSFbknjg4AyM95JLUBXYpKrN5/zp/sY02Lf0mr6SYgTsy5ng==
X-Received: by 2002:a05:600c:4f50:b0:438:a313:cda9 with SMTP id 5b1f17b1804b1-43912d3ef66mr51882415e9.10.1738927997504;
        Fri, 07 Feb 2025 03:33:17 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd53a6esm4207208f8f.43.2025.02.07.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:33:17 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6] serial: sh-sci: Update the suspend/resume support
Date: Fri,  7 Feb 2025 13:33:13 +0200
Message-ID: <20250207113313.545432-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S supports a power saving mode where power to most of the
SoC components is turned off. When returning from this power saving mode,
SoC components need to be re-configured.

The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
returning from this power saving mode. The sh-sci code already configures
the SCIF clocks, power domain and registers by calling uart_resume_port()
in sci_resume(). On suspend path the SCIF UART ports are suspended
accordingly (by calling uart_suspend_port() in sci_suspend()). The only
missing setting is the reset signal. For this assert/de-assert the reset
signal on driver suspend/resume.

In case the no_console_suspend is specified by the user, the registers need
to be saved on suspend path and restore on resume path. To do this the
sci_console_save()/sci_console_restore() functions were added. There is no
need to cache/restore the status or FIFO registers. Only the control
registers. The registers that will be saved/restored on suspend/resume are
specified by the struct sci_suspend_regs data structure.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

The v4 of this patch was part of a series with 4 patches. As the rest of
the patches were applied I dropped the cover letter. The v4 cover letter
is located here:
https://lore.kernel.org/all/20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com

Changes in v6:
- used sci_getreg() before saving/restoring registers to avoid
  WARN() on sci_serial_in()/sci_serial_out()
- splitted sci_console_save_restore() in 2 functions:
  sci_console_save()/sci_console_restore() as requested in the
  review process
- adjusted the patch description to reflect these changes

Changes in v5:
- fixed typo in patch description
- adjusted the patch description to reflect the new patch content
- added struct sci_suspend_regs and dropped the suspend_cacheable
  flag introduced previously in struct plat_sci_reg; along with it
  the updates in sci_port_params[] were also dropped;
  also, the function (now sci_console_save_restore()) that saves
  and restores the registers content was adjusted accordingly
- s/sci_console_setup/sci_console_save_restore/g

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- rebased on top of the update version of patch 2/8 from
  this series

 drivers/tty/serial/sh-sci.c | 71 +++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b1ea48f38248..4bc637f9d649 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -104,6 +104,15 @@ struct plat_sci_reg {
 	u8 offset, size;
 };
 
+struct sci_suspend_regs {
+	u16 scsmr;
+	u16 scscr;
+	u16 scfcr;
+	u16 scsptr;
+	u8 scbrr;
+	u8 semr;
+};
+
 struct sci_port_params {
 	const struct plat_sci_reg regs[SCIx_NR_REGS];
 	unsigned int fifosize;
@@ -134,6 +143,8 @@ struct sci_port {
 	struct dma_chan			*chan_tx;
 	struct dma_chan			*chan_rx;
 
+	struct reset_control		*rstc;
+
 #ifdef CONFIG_SERIAL_SH_SCI_DMA
 	struct dma_chan			*chan_tx_saved;
 	struct dma_chan			*chan_rx_saved;
@@ -153,6 +164,7 @@ struct sci_port {
 	int				rx_trigger;
 	struct timer_list		rx_fifo_timer;
 	int				rx_fifo_timeout;
+	struct sci_suspend_regs		suspend_regs;
 	u16				hscif_tot;
 
 	bool has_rtscts;
@@ -3374,6 +3386,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 	}
 
 	sp = &sci_ports[id];
+	sp->rstc = rstc;
 	*dev_id = id;
 
 	p->type = SCI_OF_TYPE(data);
@@ -3546,13 +3559,57 @@ static int sci_probe(struct platform_device *dev)
 	return 0;
 }
 
+static void sci_console_save(struct sci_port *s)
+{
+	struct sci_suspend_regs *regs = &s->suspend_regs;
+	struct uart_port *port = &s->port;
+
+	if (sci_getreg(port, SCSMR)->size)
+		regs->scsmr = sci_serial_in(port, SCSMR);
+	if (sci_getreg(port, SCSCR)->size)
+		regs->scscr = sci_serial_in(port, SCSCR);
+	if (sci_getreg(port, SCFCR)->size)
+		regs->scfcr = sci_serial_in(port, SCFCR);
+	if (sci_getreg(port, SCSPTR)->size)
+		regs->scsptr = sci_serial_in(port, SCSPTR);
+	if (sci_getreg(port, SCBRR)->size)
+		regs->scbrr = sci_serial_in(port, SCBRR);
+	if (sci_getreg(port, SEMR)->size)
+		regs->semr = sci_serial_in(port, SEMR);
+}
+
+static void sci_console_restore(struct sci_port *s)
+{
+	struct sci_suspend_regs *regs = &s->suspend_regs;
+	struct uart_port *port = &s->port;
+
+	if (sci_getreg(port, SCSMR)->size)
+		sci_serial_out(port, SCSMR, regs->scsmr);
+	if (sci_getreg(port, SCSCR)->size)
+		sci_serial_out(port, SCSCR, regs->scscr);
+	if (sci_getreg(port, SCFCR)->size)
+		sci_serial_out(port, SCFCR, regs->scfcr);
+	if (sci_getreg(port, SCSPTR)->size)
+		sci_serial_out(port, SCSPTR, regs->scsptr);
+	if (sci_getreg(port, SCBRR)->size)
+		sci_serial_out(port, SCBRR, regs->scbrr);
+	if (sci_getreg(port, SEMR)->size)
+		sci_serial_out(port, SEMR, regs->semr);
+}
+
 static __maybe_unused int sci_suspend(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
-	if (sport)
+	if (sport) {
 		uart_suspend_port(&sci_uart_driver, &sport->port);
 
+		if (!console_suspend_enabled && uart_console(&sport->port))
+			sci_console_save(sport);
+		else
+			return reset_control_assert(sport->rstc);
+	}
+
 	return 0;
 }
 
@@ -3560,8 +3617,18 @@ static __maybe_unused int sci_resume(struct device *dev)
 {
 	struct sci_port *sport = dev_get_drvdata(dev);
 
-	if (sport)
+	if (sport) {
+		if (!console_suspend_enabled && uart_console(&sport->port)) {
+			sci_console_restore(sport);
+		} else {
+			int ret = reset_control_deassert(sport->rstc);
+
+			if (ret)
+				return ret;
+		}
+
 		uart_resume_port(&sci_uart_driver, &sport->port);
+	}
 
 	return 0;
 }
-- 
2.43.0

