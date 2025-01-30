Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64208522F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276412; cv=none; b=d6lQ8+1JjJZdfm0E9aLlfoAotFf2DDzT5bpN+gUgJeWrkU8cxa6TJGTq6SV7u6hXNYdLUJOq+gaeTZxFuo3XPMcYqaO4j/lMVoIA+hFhZ0EBnazYNUAeD4wQd/a0dqtQnfHca5wb7TtbOOBK7ODK08ZShIHu4vXT5HvQzlUEl8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276412; c=relaxed/simple;
	bh=3FWwzxrS3AI/GxYVZsaGrLnVdOjgxvtoey4MF5AXqaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhlBz1X1i134cY4pkrBxqTEVeGCvQCtaeng0wCa+yWmPEYHUN1fpZLi8RF91biOIVI5te9No/KTuAjLi3tiR4Smo0kjPKj2ohdH2VpMlIePdYcjxXfhr6prV3fgYVnTd+og2EWsCiP7PN2v9WJAZ2C7XxD3R2lE1GByLqdu/Ve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P87Nt6Kl; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P87Nt6Kl"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51882748165so414348e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738276410; x=1738881210; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYgfRIuZ7IwPp/EtReOgKxJyTpKRqNT11xcbGHmWx2E=;
        b=P87Nt6Kl+lPS5kNnGiGvNy36/3mSMNRWEUK/Mu/XTtz+MeNrKcnsMrjQGrNl3UK1iy
         0WVAvHUoDllUJm1oqjGH7fgWJydAEaxl5XWhj77cB0tHBnFdPDZKcW0eIirQVkOHC4a2
         OA4SGi3xRk0eIoiD7VGabdWeBubOZwdbuPWDzpf9j52cgKB6jpB0c4qTq8saYZsokiui
         Jh78CVxkjQcjmhzMSCr9HZtTmbcNPku4H75ujmPY3M0eVtWAQAaiJQbpbtAYczxOz0tb
         b8Usy1yYqtqlzHt0DUVz3UJdLeXKL/Jcr5+c/KLQVqNyxXzkQl1f3GX206Ln0zZI3G8A
         nzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738276410; x=1738881210;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYgfRIuZ7IwPp/EtReOgKxJyTpKRqNT11xcbGHmWx2E=;
        b=WBAz7A3yn622EmPa24O6UQJYeNH8oCxUe7IbxoSh6472CK5DVwvF7wp1dF08wmuXao
         a9u9IU93YWLiyU+RCLZl0FQFGlSm4ayz734u9KLTMP+r+aS3T4IbXjreF+AP3enke6kJ
         4PruqT+UJaek4FxyFm+ydDkdIEbItVTDoXUKIHfSrhEZOD39pUNeGaUlh7uYKyIs46jO
         nI0oy/UupwShbHcr46cFcHIuKF93lLn8ydMdltNZv9JHgFt9mDyT50DjcsmsSBNTNQwK
         AnxIduuMAZravwdrPvwkmBnfe3ZmGgV77flMJg0XH/A12d3aRwGKioVto3JEvR7rtFg0
         sXQg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Gsg+FSvsBGNp68HNCAtz2LyXLOFwXEfzTm/jebVu00TjZq2RgC51sOaH75uAl8eYOMstRVyjOWjDY6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKPbXWy8zvO4sl0mclb/l0R4oZjp7iiuFWUxn/2NR+vZq6xPbe
	G1kwhkyWdiVQuOoESoFbTRP115/Gr05kebkElzFVDYHzKxqrlka1Kna+DLdAzR0=
X-Gm-Gg: ASbGncuGHOH8vTzNrUetJs3STF9RwFpUD4e6kVhJoVChq5ay/GZwlkRLHk821esjwfw
	n6bpd/aj8U9zCUQ+dNSRPnpW8+NCK0+Sl0LnosMGDr0nZb8CqBoKATd9urDCtNWmJRTYD053D2a
	PnM43fV8hw83XfZ+5Dv3Fcee/B76pTS18Cnv3UDDZF6hn6SpFgSRgPNNDh4rBSjWtI1oEAYjIIA
	ROMZ6X+J5e5/G65Fdtbu4JvZd5RQWp9lHVlzYq2OPcpf4YxvQOPHlSyfJUpP83Fkg1zVWb1yolr
	jtyyxzA6aya2MdlDyKA3Vg==
X-Google-Smtp-Source: AGHT+IE2hjn8He8PEDgF+I769iBLN1s+NQ8qwCQ24FN4M9IyvMKP+B/J8MUWkCWqROwtbUUiB9akKA==
X-Received: by 2002:a05:6122:4381:b0:518:7ab7:afbb with SMTP id 71dfb90a1353d-51e9e4205a1mr7851059e0c.8.1738276409893;
        Thu, 30 Jan 2025 14:33:29 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.88.17.134])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c0e23fsm340944e0c.17.2025.01.30.14.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 14:33:29 -0800 (PST)
Date: Thu, 30 Jan 2025 14:33:27 -0800
From: Ian To <onlyian4981@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: comedi: add blank line after declarations
Message-ID: <Z5v-N33crehXuOyy@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

gregkh@linuxfoundation.org  
Cc: devel@driverdev.osuosl.org linux-kernel@vger.kernel.org
Bcc: 
Subject: [PATCH] staging: comedi: add blank line after declarations
Reply-To: 

Added blank lines after declarations. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/comedi/comedi_fops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index e85a99b68f31..3f70e5dfac39 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -2169,6 +2169,7 @@ static long comedi_unlocked_ioctl(struct file *file, unsigned int cmd,
 		break;
 	case COMEDI_CHANINFO: {
 		struct comedi_chaninfo it;
+
 		if (copy_from_user(&it, (void __user *)arg, sizeof(it)))
 			rc = -EFAULT;
 		else
@@ -2177,6 +2178,7 @@ static long comedi_unlocked_ioctl(struct file *file, unsigned int cmd,
 	}
 	case COMEDI_RANGEINFO: {
 		struct comedi_rangeinfo it;
+
 		if (copy_from_user(&it, (void __user *)arg, sizeof(it)))
 			rc = -EFAULT;
 		else
@@ -2249,6 +2251,7 @@ static long comedi_unlocked_ioctl(struct file *file, unsigned int cmd,
 	}
 	case COMEDI_INSN: {
 		struct comedi_insn insn;
+
 		if (copy_from_user(&insn, (void __user *)arg, sizeof(insn)))
 			rc = -EFAULT;
 		else
-- 
2.45.3

