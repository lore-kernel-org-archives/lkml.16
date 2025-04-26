Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4425C6F3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679830; cv=none; b=QdNHQuQYvGyogALZbsf+AKZmUGKdB/+LZd7TzZuP5shu+cmfYJno2H0Ug7QmjSk4fyPQPzV0o9J54QNlFPtqXQVYtns/nggBW5tOp05ikr0iIOr6K44XzwvntExohvW60/MpzLgTcuEp6+4zAdzQRSZsGdch4E0GF2B19PO/LwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679830; c=relaxed/simple;
	bh=ys6A4cDEFP1W1sJupQLltwEWdunfdSd5hz+OjsL7hK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7oUsjHFO0JEWOAuTlFfOSabA8aZ2CPBUSZRcrZIhR1NM6Q/6809PM8EkpNEI4ExCy1UgdnqRfhOHFkXqFKBuHty/NUGrBXnigVrS+jMOuGDmCF+dRiVCE3SdJcAItuuToJGVChzKgXF8gozekwdBqDl5FxhZCp4ei8mVd5nYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkIR2qZu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkIR2qZu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c1389so2234250f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745679827; x=1746284627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R12xvSBWaLq2rJ6VQZ7Dr5nb/4gTUkpwvOZxkJT4gsc=;
        b=KkIR2qZuRh49N8iQomazthfDgAhcckSuFeYay3LtsZJxmfi9srV4DxbzoEPM5dFV7T
         v9rBAl2i5qtljjtqsn9KpNOMb0iQzeG1BwOesNhrrqZPUuwMiY9cYa2sGlWaSv/RQzeM
         jNsoRhIjJwK/RoMlxf61CFvafZVkWCYl7fCV/2OrYkjZtc2m2AZkr9diWEDFvPxCv7Gl
         ND7q4maOoXqe/W1Rh7Ld/SIJdDRfkj9+wcOgzSET5qQ6xJDiA1nnsJo0F2hUS0yHi/+d
         k3SgeA5SEpbQumA7PbnHZbPcxteNny0lkUKXOfBaNHt9XyCyE/rEZTm22eT4oJisqS7v
         iTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745679827; x=1746284627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R12xvSBWaLq2rJ6VQZ7Dr5nb/4gTUkpwvOZxkJT4gsc=;
        b=r0OAn7IEs7QJ3Gv1Rlz8y5dUnBfYSGdI27XKM65ISetaLARxfpBAaNHl85mAdoVoHe
         LEVhfnY/dbOKEztSwmBQmmFLFGetMT5vAgatLj7Ww2jCK+I0bCKXysujvDGdH814jM6X
         iLggM8zVvKqv4yeBsyOMbtbUugkhJBDAZu2OidNbKR8gXOgCFaXI6xUEZrSCugcmbyis
         wAkkeuIQ/RM9Hhb8hBa+GAqL3B+YXMPNsCO/Cdzo4mo9jtM0V+hU3uq6GY+nV8QAr5yw
         qN0Kv9G7P0XW9oYOerxSSb0G+2fFfYGgr0WUu2GeNjOBl5Sht2ejYeW5vbCVjuwI8MuV
         d6lw==
X-Forwarded-Encrypted: i=1; AJvYcCX+vkX2dQEDYyvdFsDu7ltMZnt33yms4d4hdPBpXrprULx4Gk9ocCwwSL87OhLvKGbfucAJLPMBV+LrVyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycj+8Rd6gTEOy5CrdRYyntxqq5cM0CIw8cY9ZvXT8PzHAACE6V
	su8Z8uwTdRLvBZONHb1lSXSnDVP+aSUeQQyjJH1JZ77TZQu0wt0H
X-Gm-Gg: ASbGncu5/zT+On/T86qh5GiJNTPs9LWkZQr6MtfHXRnbcd1DZPYsFSltmUsAHakFmdu
	SuAPnhCongC3GZ6WFWGJetyb++EmIeER440QjDN79olBUBWjbPIjijzD+8lLC1V+ju5KV47yjoi
	IkIVf1OjHFCFqW1Uclr7Q4FiQCjs1u9FePG8FNd/eA2dfKXuKbor4/ZHPy4w4BT0jhbKS75cAFs
	1GYsYIY0jlIr3+oUF4no5jhZFeDMwxTnOzAoXrj/tC4iZ/Po6ZjZfJ06Qzh0pFDuwgYZ9Qc0vXG
	vUGkDjdENfdx/Z/oTVDNL1iv0mmMapjzDgIp9mrSe/d5cI4CxDV1Tut1AGI+qA+dV/4f4U7fXaH
	5
X-Google-Smtp-Source: AGHT+IEjx09wY5wUftFqqXjkXTMQp6yzODOhA+KvWTfu3F37Mh9vH6f9hED17Nc5kra/W1ybxH13cg==
X-Received: by 2002:a05:6000:40c8:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a074f1488emr4646345f8f.39.1745679827039;
        Sat, 26 Apr 2025 08:03:47 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm5931813f8f.98.2025.04.26.08.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 08:03:46 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2] staging: gpib: Fix lpvo request_system_control
Date: Sat, 26 Apr 2025 17:03:19 +0200
Message-ID: <20250426150319.5580-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IEEE-488 GPIB standard was designed to ensure that there is only ever
one controller-in-charge on the bus at any one time. If a board becomes
controller-in-charge on request_system_control there is no way to ensure
that there is not another board also acting as controller-in-charge.
This can lead to bus conflicts and hangs.

Remove the setting of controller-in-charge from request_system_control.

Fixes: fce79512a96a ("staging: gpib: Add LPVO DIY USB GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---

Changes V1->V2: Expand commit message to include user impact of bug

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 2e315c7756c4..3cf5037c0cd2 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -916,7 +916,6 @@ static int usb_gpib_request_system_control(struct gpib_board *board, int request
 	if (!request_control)
 		return -EINVAL;
 
-	set_bit(CIC_NUM, &board->status);
 	DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
 	return 0;
 }
-- 
2.49.0

