Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232EE28C2D3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294177; cv=none; b=r7IkUANojBw52DXtpPHm/5Atq6PV+in1yipokrERTRCj7lRCq4HNi31TcNL82ya0qGE81GaKeHZ4CFdm2zKyoP/vYfbk1JMTInYbdnqe02eGAUHm0fMM7QkGFF83ELeApetZNm806hJx/BaQM6c275bvl4C4sCVIZh+QgIPEi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294177; c=relaxed/simple;
	bh=GcqUSQ1qcmz/7ZeeKmvY5jkflwUDRB3NFv+8GdhdPdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBRVKbm12H/hsxaQtXdY1VEuMHLLO6AtGTlYQzlyI97RVEY7x0qcVq9fFLpD6nJWUmDvbTPQlT3ynQsTW5exVq22GntJJyKrlWxnUay0hGozMsZHixdVsE8O8jvOhrwAotZInbITIu5WVVHNQq33SbJ16IfBW3IAnEkX4CCGf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aRzpc+sx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aRzpc+sx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso31779755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294172; x=1751898972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdmllR+tX3Z721QiQkxJd2Ok2zA1l/euwA16MKRoano=;
        b=aRzpc+sxo8QYXVYsSFsuJtsXBTlWUpVL/rXRnLqwbgEWzd97vPf8b+Si9nmDXDIyPK
         XTD+APbrcDs5cImjTcEIcCIqwBroI1cu6RJzymGZvi5LF3Q95Us2xGM8+eh4RXvU5D/C
         Raqg2VFtDUIlUb0eeh6f5LNdue1At00QxBubI9xGQ7fEYj4PDVZVbISbAFrKfGSP9XGB
         QfKrSmh/MhJESFcqkO6tYAvUefssPU24PtZIY+1eO8J/AV4qDyM8EVjIl4PTptKlVj8y
         upzqEi+jN/NOgViCGjyTlSKDHR6bSZZ2JPbzIAvgIKFrxiPL+HIvy7kQrDWXCGKnN8tZ
         VcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294172; x=1751898972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdmllR+tX3Z721QiQkxJd2Ok2zA1l/euwA16MKRoano=;
        b=DBE48RbEK9qpMr+TgXYZr4hUbMP/b6ZQvnAGgSoc9gaQSifAGQi1JsuK2Nm/eENAMG
         kmyOsswuPFyUX9qHmh49/fQhzzTZwy2ksnoBYoYmt6kLlhpgXe3pmRx+aRr7hxqT2MX0
         fkqqkxmeRJA/T+xKsypsJvw0mrcZQo3/3bTKlV06VnNYfVTofhG9luBjgKU8dWmjZURC
         2kZT+j5I0voKb8futZ8hX0ywuWqUZuvE7tWCPM2yb300/6OGIIPJAcMn5IBtZBZ/wHvq
         vW354Axw04tMmm2uyrhqLgNFKfk3DmaGMc7DWmRNknI+MPMMkRKZPJFdNQCO1yp5EoQi
         VYaw==
X-Forwarded-Encrypted: i=1; AJvYcCUzp9dAEbLrr6bD4opesoXcs0jxnyMq5VniEmEn8fdCauhSen/xpoWhbre6djs3PupgwGRIVv2yV/b/7dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiV3tkwsXVe1tnPuUDG/5TxVo+h3OAybOJIayBvMeNOWESACBb
	FcGlDDkMxUbYq6B+NIG62lRQYIz89t6zVnIceeF5Dri32gQd6NA1PRnqSelryRTA8YwETTMDMkj
	AW8fDLRw=
X-Gm-Gg: ASbGncv+iI7XAEgaDcTUZmBjKxKp1BZqN57CZxv/sABYl+UAwsdhd3c3VRhXNmIbF2n
	pYSBQ0MxZY2Cvp/4gAfiDp1Is1m83es9j3QcDE1Kfo61T7gPFpcikU+AaG8JR9gysNl/vgYhjrK
	h+slp0F6K7Icxm+3lqtjzxs+m0q/Okus1dxAR9BUvpTjb5n4WXVvBAQzBV+NOn+Ww0Wg+eWTRln
	wLHZsCSCx6DpwvqKzc1JNMC8XzTeTzBH7v3hWoKrcIxYJneitCXsvTaAUDs6EXIDW9/AoWqEAkS
	Ebphq3yxwf32nTbQ0WllRBPsUpCPLV6q4n11TPG+YiB5hMFSLFxnuT+GCbcs9A==
X-Google-Smtp-Source: AGHT+IHplNB2XhqH2vF81/rVmM2u2fb85B4S67wVN0ofQUkT3FQ10OfKl5FvFxECzW46dMrxe1/+2A==
X-Received: by 2002:a05:600c:1d28:b0:453:cd0:903c with SMTP id 5b1f17b1804b1-4538fd62fa8mr149537915e9.2.1751294172350;
        Mon, 30 Jun 2025 07:36:12 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm139691695e9.29.2025.06.30.07.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:36:12 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] module: Remove unnecessary +1 from last_unloaded_module::name size
Date: Mon, 30 Jun 2025 16:32:33 +0200
Message-ID: <20250630143535.267745-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630143535.267745-1-petr.pavlu@suse.com>
References: <20250630143535.267745-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable last_unloaded_module::name tracks the name of the last
unloaded module. It is a string copy of module::name, which is
MODULE_NAME_LEN bytes in size and includes the NUL terminator. Therefore,
the size of last_unloaded_module::name can also be just MODULE_NAME_LEN,
without the need for an extra byte.

Fixes: e14af7eeb47e ("debug: track and print last unloaded module in the oops trace")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 933a9854cb7d..04173543639c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -580,7 +580,7 @@ MODINFO_ATTR(version);
 MODINFO_ATTR(srcversion);
 
 static struct {
-	char name[MODULE_NAME_LEN + 1];
+	char name[MODULE_NAME_LEN];
 	char taints[MODULE_FLAGS_BUF_SIZE];
 } last_unloaded_module;
 
-- 
2.49.0

