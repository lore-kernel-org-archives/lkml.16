Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976B5217F23
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429876; cv=none; b=UrV6MDt955+KKuU1CAOxykgAS9nYvaCgPVYIOib6nMfutBCj9tj2uHBnbAcQVU61XYCm/KrlxTcdovA5GeRmXJQKpj5ss2O5+MUoG91mQgtOqjwp5hUzttwlE0rIUHXyaw9EAck76MjmtYQYHL9EvEnO3N35+KtQ5S0St1SEHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429876; c=relaxed/simple;
	bh=JHqBhtwG3VggRrp7RJNQ6LFkjijJTkre089s4jgjoEk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=HnBasEOB++JGKtHk4VDZdQxzkuE8gX9j+0gbITWVoC2H9aJRMKN4V/QEZh0CH9ytpK9QZGLXJwhN6pl/LCQpaZM8OJVFowP2cmE7j2gSHlHrRNXh/xnvveedP7As67ndgSA1cUuWdrVg/tae5KLQOQRryk2gojVHKkI786YyatY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUTlS6Q+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUTlS6Q+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-44b1ff82597so38453015e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748429873; x=1749034673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c2CBsPuNRj2NxImrwVUIpQ1aE4dbrchCbO1E9TXK39E=;
        b=lUTlS6Q+/1HWn9QSsqniXPkPbFkoDZZtT6YixtqmVHoqIktQo9j1KEAMD2Avx1DDH3
         tNtBHAsHmryVjWxj7Va77sGCpsolvBZC13nNb4P92VJu7LDVJgZ6GFDxVx/pk622KYx7
         vRstDA25NPmo0zbmhpZK69Trubk7bXhFrvJQ39TSCW90uLemhFMcw3p3rybYsl+LfdoP
         UfnMkm0uoBJb3KFxIW/mocNSJZhpwV+dY+CFRVN63wLmcttDofOsygQKpKYDpny1PtDy
         8IngJHvcGpGolySsGZiGkJFr0GDvKnp9A2HDBLCUXaEONankQuDCgAboanX0EtCxh34p
         K5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429873; x=1749034673;
        h=content-transfer-encoding:mime-version:user-agent:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2CBsPuNRj2NxImrwVUIpQ1aE4dbrchCbO1E9TXK39E=;
        b=GciN/+1/3uBmOWYZ3fx/LA4B0zIPSBHYrL39c+lD8KnaBxdPp5pFmQhvskC9m9mhBE
         tHYlQqd3fvSU1E8+RY65QP/DjxIhQSxM7Il5QMBgBGHw3SROiTXSbYRP/w3EmIQMBOJ4
         dE2vrDnLCQmdl8rNSSdv8td49WykRgrGACpObppV+c8DNgnH2TJik4sSETjgsoe1X3WX
         2swj9Y9Yha/VTjMV66Y6vbXMcfmBz0swSF91eVjfacay+dtPhN0WVatDm4S7DCdnm79y
         1OdV9kraHxHrkp0Hd5qotcaKYv1D+MZjTi//NgoNWPHcpIvBEaHTMdGaBV0RWgHsUubT
         OTbg==
X-Gm-Message-State: AOJu0YxXr6Eec3sre4ocesYDGet4TDO7DuMe27HYCqoCaKul5ZWN9YCq
	dqf+OoeOA31gVi6nBYAA946oT5ydZFIIwPBTAnedKNeJb7RTpWYFSaTP
X-Gm-Gg: ASbGnculDxP3QqfppLl0uCkQU8besQPqUGwDYTqoq0raUsdW0XMXHkN3+4Rhnk3/MJZ
	ou6jFAvQk+MavjOzL+BludqwpBaVdHxbrhSGe4cBpS3151Uci47r4ScPvE3x3vX1ExEUxN5C9BW
	MUpFOqRlzFKQ2Hk+0tiXnOUChHQ316UmKVhJOoIl0lByWtDakHF03u8vivRU4O2WYRay4bVbLLj
	wl5YOKh0U9vFaiYl3gE6IJHzotrWbhN93yvwoyBcVwcWddOfweaFR6aMcMOFhwygpl55JgWaFHb
	HUC1mbZ6+ejAsCq8pqQNyXAIWnsOX4qTivy40MYQXCFU54KV1i9E2rR6BwvuMl+EUa3YyWEgtb2
	LHfdX1PxEdxAJRGl58TWeAGgmCl+Qh43szWurhadIUvLNXKkaU30gyRE=
X-Google-Smtp-Source: AGHT+IE+/oVDa4eiNfMl7zRBnj0w2qHot0cc06+zNvM3acv4RNRe93kKKnaLpdDoWqPXISlwzX0a/A==
X-Received: by 2002:a05:600c:4e0c:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-44c917f3ea8mr172866515e9.2.1748429872498;
        Wed, 28 May 2025 03:57:52 -0700 (PDT)
Received: from lifebook.fritz.box (p200300da670f9b00eea232a12c0946eb.dip0.t-ipconnect.de. [2003:da:670f:9b00:eea2:32a1:2c09:46eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45072559736sm13940965e9.19.2025.05.28.03.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:57:51 -0700 (PDT)
Message-ID: <c3c50ad1eb19ef553eca8a57c17f4c006413ab70.camel@gmail.com>
Subject: [PATCH v2] pps: fix poll support
From: Denis Osterland-Heim <denis.osterland@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Andrew Morton	
 <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Denis OSTERLAND-HEIM
	 <denis.osterland@diehl.com>
Date: Wed, 28 May 2025 12:57:50 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>

Because pps_cdev_poll() returns unconditionally EPOLLIN,
a user space program that calls select/poll get always an immediate data
ready-to-read response. As a result the intended use to wait until next
data becomes ready does not work.

User space snippet:

    struct pollfd pollfd = {
      .fd = open("/dev/pps0", O_RDONLY),
      .events = POLLIN|POLLERR,
      .revents = 0 };
    while(1) {
      poll(&pollfd, 1, 2000/*ms*/); // returns immediate, but should wait
      if(revents & EPOLLIN) { // always true
        struct pps_fdata fdata;
        memset(&fdata, 0, sizeof(memdata));
        ioctl(PPS_FETCH, &fdata); // currently fetches data at max speed
      }
    }

Lets remember the last fetch event counter and compare this value
in pps_cdev_poll() with most recent event counter
and return 0 if they are equal.

Signed-off-by: Denis OSTERLAND-HEIM <denis.osterland@diehl.com>
Co-developed-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
Fixes: eae9d2ba0cfc ("LinuxPPS: core support")
Link: https://lore.kernel.org/all/f6bed779-6d59-4f0f-8a59-b6312bd83b4e@enneenne.com/
---
 drivers/pps/pps.c          | 11 +++++++++--
 include/linux/pps_kernel.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index 6a02245ea35f..9463232af8d2 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -41,6 +41,9 @@ static __poll_t pps_cdev_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &pps->queue, wait);
 
+	if (pps->last_fetched_ev == pps->last_ev)
+		return 0;
+
 	return EPOLLIN | EPOLLRDNORM;
 }
 
@@ -186,9 +189,11 @@ static long pps_cdev_ioctl(struct file *file,
 		if (err)
 			return err;
 
-		/* Return the fetched timestamp */
+		/* Return the fetched timestamp and save last fetched event  */
 		spin_lock_irq(&pps->lock);
 
+		pps->last_fetched_ev = pps->last_ev;
+
 		fdata.info.assert_sequence = pps->assert_sequence;
 		fdata.info.clear_sequence = pps->clear_sequence;
 		fdata.info.assert_tu = pps->assert_tu;
@@ -272,9 +277,11 @@ static long pps_cdev_compat_ioctl(struct file *file,
 		if (err)
 			return err;
 
-		/* Return the fetched timestamp */
+		/* Return the fetched timestamp and save last fetched event  */
 		spin_lock_irq(&pps->lock);
 
+		pps->last_fetched_ev = pps->last_ev;
+
 		compat.info.assert_sequence = pps->assert_sequence;
 		compat.info.clear_sequence = pps->clear_sequence;
 		compat.info.current_mode = pps->current_mode;
diff --git a/include/linux/pps_kernel.h b/include/linux/pps_kernel.h
index c7abce28ed29..aab0aebb529e 100644
--- a/include/linux/pps_kernel.h
+++ b/include/linux/pps_kernel.h
@@ -52,6 +52,7 @@ struct pps_device {
 	int current_mode;			/* PPS mode at event time */
 
 	unsigned int last_ev;			/* last PPS event id */
+	unsigned int last_fetched_ev;		/* last fetched PPS event id */
 	wait_queue_head_t queue;		/* PPS event queue */
 
 	unsigned int id;			/* PPS source unique ID */
-- 
2.48.1

