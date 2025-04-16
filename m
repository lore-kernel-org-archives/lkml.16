Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769323D299
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805601; cv=none; b=HPSK8Yvnk1QABwfkHviw+4e9HuRmqRjr07MxQ8/QXFDYAxvbczgtK4tCsR79Tg221xGugVFJF4tI7jbm94Rqv81J1BVSv4ImDWVSIA588R0Ybf7B6uW+/K+DHD7qNn4HQcRNTuaUwpFpxXMDBX+4xvCLXxSto8UWA0NtODNdLKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805601; c=relaxed/simple;
	bh=32qcALkhozgdxR8h/D+a3YxcX1eNF2+/cIjLEz1VA90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azM/skmR4IobuzhyvhoRupRnLaTxqNWxBIR390oHdS8721FHg0YtTsF4xPlzyZzJjVX34oq8oBOfBncb9jKmpMAn3pnI2oWrN4sYuPxFtqSREG0oBKorm8QuOSHR65hlnFwIxfMTkkUMDAeSMVCWGuMZnJq55CUDHzsP9e7wY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEXvYHUy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEXvYHUy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39149bccb69so6561243f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805598; x=1745410398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSmaqtTVZcdVl/sdGK2L/W4l/Wfzhlhm37QhRpqw2WQ=;
        b=MEXvYHUy/Pmnuer40GBNuY+onsbiHLGEE89JjUdgZsED9HtsfD05iCh6wGwGG2sUsD
         blRFa60wLE//Zg35AJyynrx1ZRr8N4ZeAyi7Q3S83SAXcQj52JXj1/+pQl9FyLKI6nqG
         rCvqFpIk/fnX7Usez8iQfmW+ycfsJDv6uvejtPgBS5NIfWwefEgMJ29+IRT3eVJYjOh6
         BLPr6eSUFr5g6q10iBafAjdSHdh7sodh+sqvvuBF4xIAfgiPdEiH/Ow9Mk1FZth2T8ji
         LCZBK0gVMQF7dEoDborh1lWLJIj0zf61AmoAh1ah/1SvPHZNJ8yPz29Vb1GocDvgWB8P
         tIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805598; x=1745410398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSmaqtTVZcdVl/sdGK2L/W4l/Wfzhlhm37QhRpqw2WQ=;
        b=J49vt+By58Ak9Y4wZCeR9lyoRuR/yqdLkLtJ9g2XldArrYVoF8s/vduEOOPHRjC9Ve
         lO285QYLc0CtTHBMlIBWEqoZ17vLiEBjbspz+LIsHT2TI6XG27CgTErMsh+blrRQ5/lN
         fcWjWFuEimt2+mCV5L+cZl7B5svWb+j07oUmMi8P/hD0XkVg22sgayO57zRndn1K5S5I
         cKANbmuYdMlw2vtTTMoKMiiQFQk3I7V3noRuZs+tmxiEUJDL/xxuyzL5pbkrrbn/SSsJ
         9Pq3M769Mz/FRRA+KBZI9VwuAvG7hNNzJtu20p4AQ8H6BSKElfHTL1Pi/7WQel4fMBEm
         drDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWerxr/KX25UzLC4zDBvAnbu7nXmIk7KA5qCPAqkRQgLRIw5YNPvueinAGGwDs/zawf0o9TRo5RZUS3NGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwAK9IZDvywiw1wiy/TElYMe1aoebNid8U++5MmbkDhSO1W3ih
	1DVy3rdnuW2UjznbWvZc5C5aL2TfeiDvwS8lNe7bzZl7HgvH/FUBTdTv+bLQNDA=
X-Gm-Gg: ASbGncuIjJQPCmISHk5AaRRJKQZlgGxXnEC8kFmbYjuUr1H20iX+ZvR5uuI/FeE22BF
	Tfu4IT63/cnzKreqGZZk4F1IGrK19B4AM78izH3whIBNE/szZuQ5Ay3slmA7ANCoUWSosRBGK95
	X3SaF1QEBfF4XCi0ELzKK5RhdJp9J1ze9wxWSxrnv14xFoRuaSnFFAIFzV5oRU2II/Ag0Em7AoM
	jEJjuJxhuHrFKjCkAFmqXfY89QuN/WpDxeohAvV3Fxa6m6CcP2ivHXIs44eelBkGsGVxYlUo303
	35/UEqXU/HmPoZ+E0IQz9sKrY7WI3LXvnwazjPS7rncUlnY=
X-Google-Smtp-Source: AGHT+IHtIMhNWLVJYxB2YnXeeSb6vHi3amDsuHFe8N+BB3U6tNqVPg8wr4yAeHJMiQyadWdrKNb/ug==
X-Received: by 2002:a5d:648c:0:b0:390:fbdd:994d with SMTP id ffacd0b85a97d-39ee5b1bcbcmr1785625f8f.27.1744805597389;
        Wed, 16 Apr 2025 05:13:17 -0700 (PDT)
Received: from noctura.suse.cz ([103.210.134.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce3bsm17327555f8f.66.2025.04.16.05.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:13:17 -0700 (PDT)
From: Brahmajit Das <brahmajit.xyz@gmail.com>
X-Google-Original-From: Brahmajit Das <listout@listout.xyz>
To: brahmajit.xyz@gmail.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	pawan.kumar.gupta@linux.intel.com,
	tony.luck@intel.com
Subject: [PATCH v2 1/1] regulator: hi6421v530: fix building with GCC 15
Date: Wed, 16 Apr 2025 17:43:05 +0530
Message-ID: <20250416121305.13469-1-listout@listout.xyz>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415111411.6331-1-listout@listout.xyz>
References: <20250415111411.6331-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since the Linux kernel initializes many non-C-string char arrays with
literals. While it would be possible to convert initializers from:
   { "BOOP", ... }
to something like:
   { { 'B', 'O', 'O', 'P' }, ... }
that is annoying.
Making -Wunterminated-string-initialization stay silent about char
arrays marked with nonstring would be much better.

Without the __nonstring we would get the following build error:
drivers/regulator/hi6421v530-regulator.c:189:19: error: initializer-string for array of ‘char’ truncates NUL terminator but destination lacks ‘nonstring’ attribute (21 chars into 20 available) [-Werror=unterminated-string-initialization]
  189 |         { .name = "hi6421v530-regulator" },
      |                   ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Upstream GCC has added this commit
622968990beee7499e951590258363545b4a3b57[0][1] which silences warning
about truncating NUL char when initializing nonstring arrays.

[0]: https://gcc.gnu.org/cgit/gcc/commit/?id=622968990beee7499e951590258363545b4a3b57
[1]: https://gcc.gnu.org/cgit/gcc/commit/?id=afb46540d3921e96c4cd7ba8fa2c8b0901759455

Thanks to Jakub Jelinek <jakub@gcc.gnu.org> for the gcc patch.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 include/linux/mod_devicetable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index bd7e60c0b72f..e3c9c427443d 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -605,7 +605,7 @@ struct dmi_system_id {
 #define PLATFORM_MODULE_PREFIX	"platform:"
 
 struct platform_device_id {
-	char name[PLATFORM_NAME_SIZE];
+	char name[PLATFORM_NAME_SIZE] __nonstring;
 	kernel_ulong_t driver_data;
 };
 
-- 
2.49.0

