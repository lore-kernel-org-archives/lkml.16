Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6039B2777F9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222204; cv=none; b=rJnd1AalYOdCRmoQng+l1ugsgrH7KmRviahHdxVGH9VfC52d+gthFCqe4sbX0NOyObRl26x7QOd3ENCsvoavEUt5Cc3xsi7PDqKVi3B4pbHmwiKaQZ595DQtIQaiTzHSaB3o+UvM2ad2fITcnhMxMrdo9cinuBKDQSBhqIEMLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222204; c=relaxed/simple;
	bh=N95I4jtfm8tV/UxSD/+PkNeT+KRbUV2lDcZrHgxcpkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac7aTK7W9PR1oiUGQT6S0T7N+JwiWrgdSaTQSHewZxL4f63mWWLnhFD+z4i3cycSC+bXGEIuBRxEAphUAj47yeweUIAWBK7QnavsgGxVut9PHncoJrR0vLaC3HqrFFgCdmhQdOLsBslGJYV4eeTpSWUK3sDrUevsgdOK/lQe7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=eJE8XUIO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="eJE8XUIO"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af519c159a8so8617a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222201; x=1744827001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGz8cuaRzJJ2oAljQysG1oQTihJGr/6KvD6+YWx4kWA=;
        b=eJE8XUIOUBXZaCqe/IsCaUwC4MzcZeGv3R4naduBnqhkSwQh6DADCWvfqy8gQEyDMC
         qY1BKDVzfYm6d77KvKqdjZ51kPS8BD1BeEcKA4RGmgMo5jiW/jvqL1DgJOZhB6pIly+k
         ncHwuuEBvcWDf6XLRlRLkSAL6Y7hvZzQ1p8aHkr02RtY3R1zAHmOQs2Xm4Oz2TfJ0bdF
         8Y9pHPelTcw6h91e3Gn2IMkYe4ZO6HODXoJBGj1o/1jjlVj+Lyi2D3UsMjm7kYwIAfDP
         cv0kk9yZAm/tvfzLF9tmY6jJ7s4s73Rb7R8Cjjb2vrZ/P7wgB7Iez+6QkW1EPzndUmLy
         BkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222202; x=1744827002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGz8cuaRzJJ2oAljQysG1oQTihJGr/6KvD6+YWx4kWA=;
        b=YYcCuvGEPgYpiX2lTKzKQjtEm+HGZQ7bZWg6q/OcPdYYNXzlXIVox/MaaY4g7C8qC0
         bwFb3rkCQayk29pV4SiikKQxn7rKVDmn9Qu8qPaOvqkJAez47e5l7aFI249PAEEd33dr
         muXAFV+k/hz3iCv0hCcsfe/C8uRRgElzdszB+wp+yk5gE0yGt0a6A5MjUiz63KDlvF22
         I/BKamA1WgjzYguIXySKCC2Ovh0b+eop5QNOoxk+zSfyH/1PXRrfya1bzeM+aqgrLk00
         AZIJV5c8Z8jzOP+Zxyv7z8ASGN3QN/AM2mvp/FdsjLLVotmt11TRKmPNP2/ZtLhmJzJU
         myqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq8b1CewQCkO5Q+UXcYmmHyowZqJdu2tVy/+sNJCaf1xrCgxjJGf4V3cUISAaXuREbCRGh+VsaTB9RmJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCx13sdeOCLteulnwwuOQdRu/g4esHqT0ToFGpOOMKbKyrlIB
	zEVrycy795OuEVSmKNmO1W6UQWrxV4hSYQ4XPLpbTvI+WL/itbMv9w+uAy4Veg==
X-Gm-Gg: ASbGncsXKm8mUH/Z/v7owxdYxVmBUDgGWhwd9Ifi4sZ4+0mOE+6RR3JfuehxTnXBWxj
	vai5C8z5f9mc4F58fALG1n30ohT19imHZvMA9pyWF3ZIpW3EQ+JB2GJNMgzdBadEcMktkB87bne
	sluOLijWiY8Wm9ppe5H1kzaZPXASSJ7/XnQKhWdNRjtEdoaeTxTuwUxFD6CuS7GMIOS4Z39uVu3
	MC/1Yctbvkn5YfvDCGpdxVm+NrBHCTghq0VLTyrwwQQVqmgmflE1vewC7hoUro/haGv5P4Nln/n
	UwIADba/3+MjwPmBEj2Ba2nSSX3i+OYMGWL1On+9+EWCA9q0fjFcSPmMj+moG5/aBR+MGpb4yv3
	Vzm/E5vO08ZMShjUb
X-Google-Smtp-Source: AGHT+IEgs6RUWozkbh4QD2FqyyruOz6bjWFjR2k+VOZ4ezhRHSrXbXvDWyrrTiQT8q17rBG4ISXwQA==
X-Received: by 2002:a17:90b:270c:b0:2ff:5c4e:5acd with SMTP id 98e67ed59e1d1-306dbc2e412mr5791558a91.35.1744222201702;
        Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e659sm1970502a91.16.2025.04.09.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 05/23] staging: gpib: gpib_proto: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:35 +0000
Message-ID: <20250409180953.398686-6-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 4c01c436b9a7..1c8e5955b9ce 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -21,16 +21,16 @@ static inline unsigned long usec_to_jiffies(unsigned int usec)
 int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result);
+	  unsigned int usec_timeout, u8 *result);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
-int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
+int ibcmd(struct gpib_board *board, u8 *buf, size_t length, size_t *bytes_written);
 int ibgts(struct gpib_board *board);
 int ibonline(struct gpib_board *board);
 int iboffline(struct gpib_board *board);
 int iblines(const struct gpib_board *board, short *lines);
-int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, size_t *bytes_read);
-int ibrpp(struct gpib_board *board, uint8_t *buf);
-int ibrsv2(struct gpib_board *board, uint8_t status_byte, int new_reason_for_service);
+int ibrd(struct gpib_board *board, u8 *buf, size_t length, int *end_flag, size_t *bytes_read);
+int ibrpp(struct gpib_board *board, u8 *buf);
+int ibrsv2(struct gpib_board *board, u8 status_byte, int new_reason_for_service);
 void ibrsc(struct gpib_board *board, int request_control);
 int ibsic(struct gpib_board *board, unsigned int usec_duration);
 int ibsre(struct gpib_board *board, int enable);
@@ -39,11 +39,11 @@ int ibsad(struct gpib_board *board, int addr);
 int ibeos(struct gpib_board *board, int eos, int eosflags);
 int ibwait(struct gpib_board *board, int wait_mask, int clear_mask, int set_mask,
 	   int *status, unsigned long usec_timeout, struct gpib_descriptor *desc);
-int ibwrt(struct gpib_board *board, uint8_t *buf, size_t cnt, int send_eoi, size_t *bytes_written);
+int ibwrt(struct gpib_board *board, u8 *buf, size_t cnt, int send_eoi, size_t *bytes_written);
 int ibstatus(struct gpib_board *board);
 int general_ibstatus(struct gpib_board *board, const struct gpib_status_queue *device,
 		     int clear_mask, int set_mask, struct gpib_descriptor *desc);
 int io_timed_out(struct gpib_board *board);
-int ibppc(struct gpib_board *board, uint8_t configuration);
+int ibppc(struct gpib_board *board, u8 configuration);
 
 #endif /* GPIB_PROTO_INCLUDED */
-- 
2.43.0

