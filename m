Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5272E49A3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546549; cv=none; b=h9yoxNXELpvWKPLBoRuhgkq3aWxijEb5Pdrmoaa6Fs9Z4ud33TezLdUgB7BPnp3UMsLOxo+vu6rE3IsU/ZCkINqHxmj+2asXIaiW8SRz4wcs6JKOo71be/WVbMyCm96K2rbtwYRnF6Doa1sBbl27invgHJT8g4JXimE76aSagxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546549; c=relaxed/simple;
	bh=N7vLc0oqLmYrsKimgv5aPGLXrXUvS+KvfduP2VAQNUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWsDKMmt4U8+Nnd3v2WGmMIHdgVlKbHfv68FwyK2/I04bLauV/8ku3YKLO+4Dd2L3jez/3xJi+zVeoZSBrjHh71/qj3LJ7fn7aayxtnx3t//kytP73nn7GRIqylfix6uMPCUvf7jWoxS9OcGhysTZw/yQHO7ZGjUf9uVpeA/97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfCuwHOn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfCuwHOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GrhGjJGChgvyGST3XK03qsYwL/VV6VbNHViMoMb02Ss=;
	b=EfCuwHOnT6XoDFiTIfVSG5cZ/dTDoQ9kwmMHAz8G0KRxU4s0FXWcE6tznreLaz0o4scwy7
	V0FQPDAPB5h2Cz9ll6CN9th3j8owtarU8plug1t5YZC2Kh62JGDG7k+yUQQ53wzEqP5Zry
	2RzqfFkDfj27iwy/E5kd7uLWY7RI3kw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-i-1xjUUsMuiueQ25Iz2hiA-1; Thu, 03 Jul 2025 08:42:25 -0400
X-MC-Unique: i-1xjUUsMuiueQ25Iz2hiA-1
X-Mimecast-MFC-AGG-ID: i-1xjUUsMuiueQ25Iz2hiA_1751546544
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso3418967f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546544; x=1752151344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrhGjJGChgvyGST3XK03qsYwL/VV6VbNHViMoMb02Ss=;
        b=JjWejcdKWleKhUatNmS11u3sTN9xSqmQeyJ1W+5S8HHlHZtF0GCO/ZGl0O9u3R4/SF
         4KG8rIDBTx4m4REKBsi2dx9u7pcGnUyz6VclryuY03PhbJz4JqLrMokQRbCKVUy4e01x
         P2LzHDRVAPa1nb19QT0JCDfh1nSNm4xn03bnjGo8czdx6Eon0Fwt5XBnR/GbIxrDGJ0/
         aGFJ92zTk5DXZolsJhoBU60u3LVgcPGvuUp7WTUR92xF/ggM1L3OhnltF4KHKTvDXKyi
         YmE91QhtFe93kcxk5PS1gyRAwvpi0TctVrf4QWpD9t6Z+k1gR7SmU4hDCfWwXO+oARwK
         6RLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRdmNcYlIVTA4gD7Dh1IyxkoeHXFNkPsNT6WyvWF0mv/7s5H/UYZDoOF58LZd7Uo4TK8Q+1jFk61K6Q3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZY9AfVgJenBRzzH00KjmLl2rISUULxm4/X8Lpu34gn34LWzJ+
	GLNlRW5hZzZgALEFDE4CuQQmvqVCvpP31GCpWhZtzsROpWvLrfXpbeYAM4b7Io9Lgs0LBhQoJ2s
	IWXiIZUtJiug100ecN42N6kOCACMdAXmfsRjV59qZEwqkFRSdkYBfuhja1NFvpsdOSg==
X-Gm-Gg: ASbGncs/viEby7w9UWprwGXviUZm9jpB7Pt8sm0bFTdihpA+lLHYRvK+xy3Hz+uJFKB
	I2VuIT3qRh8Lkf+b40qdp7OzETeRiJO/lfd19YQV7DzObaOeLYkklAZgQAQm3BePMFPUymNOg0x
	Ba3+5LlY7jTKgmrrPby6d8xyU9SGPnxEiC7pDCisLi61z7HiJbYravAPLKrZUwgKVUevdfef1KV
	N6ag4h9VceajBANmCLroQ0KkVyxtZ7kEH67ew1Q9GZmXFk9S+3qCPqQMvcdbZdR/5az+FsuPQcI
	VazJv7fhehv7R8MZgY9eLLs0PGy045TcZsl16/uted70nXDL6Fp0A94lP+uLZOmZO7Z5+Hr94ib
	kl4mm93wD
X-Received: by 2002:a05:6000:23c8:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3b32c56e028mr1862342f8f.9.1751546544129;
        Thu, 03 Jul 2025 05:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGKF27IryF4nLaw/mmC8T58sLstUYF65xX0zcwluxL2FD7cUu4oHOdykSBFHXSnS2cVC9xlQ==
X-Received: by 2002:a05:6000:23c8:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3b32c56e028mr1862319f8f.9.1751546543604;
        Thu, 03 Jul 2025 05:42:23 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99a3b81sm25365195e9.26.2025.07.03.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:42:23 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH] ACPI: processor: fix acpi_object initialization
Date: Thu,  3 Jul 2025 14:42:15 +0200
Message-ID: <20250703124215.12522-1-sebott@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialization of the local acpi_object in acpi_processor_get_info()
only sets the first 4 bytes to zero and is thus incomplete. This is
indicated by messages like:
	acpi ACPI0007:be: Invalid PBLK length [166288104]

Fix this by initializing all 16 bytes of the processor member of that
union.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 drivers/acpi/acpi_processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 7cf6101cb4c7..2a99f5eb6962 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -275,7 +275,7 @@ static inline int acpi_processor_hotadd_init(struct acpi_processor *pr,
 
 static int acpi_processor_get_info(struct acpi_device *device)
 {
-	union acpi_object object = { 0 };
+	union acpi_object object = { .processor = { 0 } };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
 	struct acpi_processor *pr = acpi_driver_data(device);
 	int device_declaration = 0;
-- 
2.50.0

