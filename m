Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB81C8610
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620331; cv=none; b=nFx5Ei6nhRkP+DaUUfP80rEZYk5JJv/Saees0H6Y1Ed1gLaOnMVtV4bemr2cBMjMNG4vEKsKIR3DhMdXSeMxa0TcpyRwd2VRB4d6z+j4QlbqIEVzkrTrYtoksGIgQM62cwWwhGKuQanijdejd63HmawP7vwWjwLYQpSBndGn/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620331; c=relaxed/simple;
	bh=ncET71PnXmAIuxS1eDPnjLvMD/7yLWiphKj4eRN1Lgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hZqMpuPWToEu40pgGbNJyE9KFyTkt+4wUSbNZJMfusULkHdYMa6A6CFtJ+9zm+/9t5V7hcByxg0DwETFFIGgEqbyjJzaTIbz2gsMnnXx9TkeMIqUphKAV3J5FWRqs4gz2x5Fia5o6p1y+6/wFSj3Eb/6KEb4BtYK0bbQyBm83To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EzGJnTdu; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EzGJnTdu"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a969a4d0so2027384b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620329; x=1748225129; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtx35lMEeWWAqT/U2Z/PODh9i6/0f0jADTP6jp+X+cw=;
        b=EzGJnTduREKeYPLGIq8AA1H+vVEckY1NebrT3FWaXF3aFhtrcmqdG4bu7rVy2Vz1d2
         2tpM57nwoPBlDZtI2JrNTxMQBKOI7MLNx3w0kf2/7wOiPx6uMcPbK9JbrjqNkz7AKptK
         rEG+x28yBO9ORyG+uIrZW7YKvgAuCVHMcdU2PNdP3vd2xu0NqN5WVCbVMivkHi7aM+Nk
         VG/SPjJi2Y5wmgWT4L1C3e3ikw+0nj0+SZG1qkYPR7Ryt7z/LfzxRn3mpj9OQ0zLZumI
         /7Ol6h0jHMAWnZpw7kEdVghD8HO6Mtr+ADXvZEHHhv8SbST0wW6EnbWFvVxcPlqzI9Xm
         6bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620329; x=1748225129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtx35lMEeWWAqT/U2Z/PODh9i6/0f0jADTP6jp+X+cw=;
        b=ZqYw6+k9DDGHl10gXbTSIhI1B9qQgDiRMFlVSgTlLZ4PeNaiyo+OewJ5lysLlDYe4C
         g0orl2VPYA+Rkjeg9HZSkwQlE5x8/uNnO4/vt1JBWJIyRan7SdccVCF+ePVV6jzROZwk
         qVL/iR70BISeaCRIZc78HBJMPFCSakUyrwO9DydF8N5QCbHW4jPgdevXdpva1Acdloju
         iv6rNpuv7RtXCU9OkiotIPVaU/u/Hp7NamekHjWeKjHrBsuL0LnTtIKzxpppNbtAHiSz
         0wuVrs9ctaFIE6VglHyg1Er38gpRWcDY7X3EX6H37MevuLXMrD/MY64VCZxDiBUppmMD
         CvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnlnf1yM5rAlkCVBTeOqejRkBosfK8ySqe+rVS+BBQjWlEcHcMNkA4qD04MOqS7NC1+SMdakkNXTEdUOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzslb/21ORAqRJzxFQYCXVn2P1C5O1lrCXQblHIKJUnYHnbkzh4
	vCbfXkz8s0TzOgd2JzDRbJXqIAwn25QLqPWyPZJiQvBlZ33VAQCHZ9kUtncACnYFNH3JlvaSkCB
	JR72A3WJKvEBtVJbj67vZBQ==
X-Google-Smtp-Source: AGHT+IG881scAg6068dy4VU87+f746XKKj2E3wn0Hst8ag8ARBHagr2MNT6C67LOjGi+Q28aMdcJxsc+EbqZ1Dgx
X-Received: from pfbeb1.prod.google.com ([2002:a05:6a00:4c81:b0:73c:2470:addf])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d19:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-742a97e6b2dmr15128592b3a.14.1747620329219;
 Sun, 18 May 2025 19:05:29 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:45 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <2d94a42ca51de9fddddb64f74e217dfb2e0c7d1c.1747619816.git.ericflorin@google.com>
Subject: [PATCH 2/9] staging: sm750fb: rename `hw_sm750_deWait`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_deWait` to `hw_sm750_de_wait` to conform with kernel
style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_deWait>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d74836fbdfa3..6a6b48254af8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -609,7 +609,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				    hw_sm750le_deWait : hw_sm750_deWait;
+				    hw_sm750le_deWait : hw_sm750_de_wait;
 	switch (sm750_dev->dataflow) {
 	case sm750_simul_pri:
 		output->paths = sm750_pnc;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a797985a4df7..e24ec6a9799e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -194,7 +194,7 @@ static inline unsigned long ps_to_hz(unsigned int psvalue)
 int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
-int hw_sm750_deWait(void);
+int hw_sm750_de_wait(void);
 int hw_sm750le_deWait(void);
 
 int hw_sm750_output_setMode(struct lynxfb_output *output,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a5bb067b30cc..5a6ee02bb95f 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -521,7 +521,7 @@ int hw_sm750le_deWait(void)
 	return -1;
 }
 
-int hw_sm750_deWait(void)
+int hw_sm750_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
-- 
2.49.0.1112.g889b7c5bd8-goog

