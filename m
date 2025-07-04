Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDA1CAA9C;
	Fri,  4 Jul 2025 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641912; cv=none; b=JmnMNFDA7CePNxa4LApEHXmzIOHNtVuYcBZA2fO4bKNqqLH6WbGEoj4V1LFYv324MCdtTxHNjz3PhtUG0W1yLhSTIljz9mHOL5AAIYa47Pxfa7xjPlZuHiFHS/lpvG5jQdJrPgduB66uAufg8KYCv46lv8LauWLy8FdkOzasVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641912; c=relaxed/simple;
	bh=JC6aNxqLJiNxrgERg3dHfGISsgqo9cVbi6o20fNl2X8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sL2GTb4RgrUeq+KCeOPRqudE9KI0yVKffgJoMHsemWbW4poX4CXkeZ90kxkpoPXD+5mB++Ov6qdrHV5zxa0fTUEBWqkaH5IskmoxBI488MuPUNPO1Ydqz8emZNAky+KzrS6gqVpKvt5PMg/JgjB4fDiQV72PSfcbsRKiot9HYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkCHx8xA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkCHx8xA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae35f36da9dso199157666b.0;
        Fri, 04 Jul 2025 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751641909; x=1752246709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qusLXZdix5HSF6lr9ETc0fp9UfUs/stGEdK45z2VJA=;
        b=MkCHx8xANzcu2exOOCHCO4RHwdua0Qf+S0de81GG7X5uAXDrs+t3yy9qH8wrAyP1S+
         mkPHKnhVBKUw+FQpriWGMprVMJ3RxhUd/7H+URKTo6UqKJ8vHCXScUX+HPmHXZHnviBl
         1BRsZfdN+ZgbHE/Lc6FB2oW+rzrrPuWVoZ/yMZaEg3lfr9y1Zbeemfjb/qSwBr4fi3sH
         M5fzf6ZY/yVLPvmgGymjOEb5V/XWqUPHgCCQsUgL4QDhzkPTTxJRrOBxRATT4zbIoNxI
         dXItIkH8mj06DEhwd3xA1hjSnF6UVyVR8iZgKv7fyQy8rcIceGSkji8eg89STHDf8SUz
         jF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641909; x=1752246709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qusLXZdix5HSF6lr9ETc0fp9UfUs/stGEdK45z2VJA=;
        b=u93JpcV828JE3WgneDMB5t7gRBLtNbO+IKV7eR2IzcXYFFty+PQDI7pq04adYi6OrF
         gQjHMO5vNByhQIVEz422u9Iz84XE2YZGl3xA96wFTRFcnrF4Q5WJBoVP9ZarlHDhwG7p
         otN7zoCQtOHj7FRpYs3i+wAkhOdZqrYzLqxrLG+6EvnoY3wiOUbhX3ywfMgspMsv+Wmx
         zKywXsKY8aTSvTVEYU95X66Y7dJB2FZoP/yaD051M/cbVsTrPfgdwEnNHACA/FfvTY28
         3nUMlWFMZSQhdJk0nrriOd3RRZm6LWlLvjjtl96Qd1ugCqbhjfDJNrVxUROERCcTPqJ6
         S3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVK2oJEBveVcYhyVuryK885YWSou2L3Qf/Ayx7ePYC3lGb/Ja4FjKThw2C6sLdXU3SXDGYjxjVaE3D@vger.kernel.org, AJvYcCXLrll8G8ZEFKGjysB1VZEBQz1zgFt1rNWGdjdrCt9nars1ZmR9IkQXO9az8SCO2CUbgmugZQ6cMLN4u82O@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxzJhfUmSHmXloCcODk++CU5Ftewo2znNYnGS6e/BupRVhchc
	taegA6AmGwalhjZavp/BKmGST+GCJTcjLsFPs80bP21C7V76nBi6qZ5V
X-Gm-Gg: ASbGncvouS0pEeLDpf81MSZSVdx8WVjtQx+6apAyGXprPmFK7uX38we8hxPlSY5t8NQ
	qNMW3QQm1DzQ3U6pQZTkZfjwWdZ1din1J1nTFDjp9pbmejcEjzsJkjw4GcrAH/6vEy+j04Fz6v7
	jcV25pSJrARL8AA65MDokJlE3kP2WuiNpHRtN7jcBHQZYlpNbojYcOaKSws51F++CD9iVZhOFXE
	sDG1ODfWlRHnIKNxCfPUNyTKpbuiPdzAAxU0Ia1TP/iB9DSiYvV74ss/wTtPgVZFYVDhYTYYwpA
	g6Tdar1YvkjoN2+pY66wdnGz5YTmxyLC8AcpE9MlL8rlt0hi6yrGS8U1PkY5ly33HqzGKNSl6pb
	9ttY3d4qOHqYjjniITqQa9D7oEREnF9k4EpZoTw==
X-Google-Smtp-Source: AGHT+IH+O+aw6zSL1fLxHFTirFNjk3NMB7gQVoIvyy3kw7HmLqoOlErjjJoZ/5Sk3NUY623u5QReGQ==
X-Received: by 2002:a17:906:584f:b0:ae3:f296:84cf with SMTP id a640c23a62f3a-ae3fbd8b224mr231755266b.30.1751641908910;
        Fri, 04 Jul 2025 08:11:48 -0700 (PDT)
Received: from masalkhi.. (ip-078-042-182-222.um17.pools.vodafone-ip.de. [78.42.182.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b03203sm186153766b.131.2025.07.04.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:47 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	luoyifan@cmss.chinamobile.com,
	robh@kernel.org
Subject: Re: [PATCH v5 2/3] eeprom: add driver for ST M24LR series RFID/NFC EEPROM chips
Date: Fri,  4 Jul 2025 15:11:46 +0000
Message-ID: <20250704151146.12118-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f14dfb9a-caf7-4889-a892-6fd61a9a5ecd@wanadoo.fr>
References: <f14dfb9a-caf7-4889-a892-6fd61a9a5ecd@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christophe,

Thank you for the review!

On Fri, 4 Jul 2025 16:12:56 +0200, Christophe JAILLET wrote:
> > +/**
> > + * m24lr_regmap_read - read data using regmap with retry on failure
> > + * @regmap:  regmap instance for the device
> > + * @buf:     buffer to store the read data
> > + * @size:    number of bytes to read
> > + * @offset:  starting register address
> > + *
> > + * Attempts to read a block of data from the device with retries and timeout.
> > + * Some M24LR chips may transiently NACK reads (e.g., during internal write
> > + * cycles), so this function retries with a short sleep until the timeout
> > + * expires.
> > + *
> > + * Returns:
> > + *	 Number of bytes read on success,
> > + *	 -ETIMEDOUT if the read fails within the timeout window.
> > + */
> > +static ssize_t m24lr_regmap_read(struct regmap *regmap, u8 *buf,
> > +				 size_t size, unsigned int offset)
> 
> Why returning a ssize_t?
> regmap_bulk_read() returns an int.

Since I return @size (of type size_t) on success, should I keep the
return type as ssize_t, or would it be better to change it to int
to match regmap_bulk_read()?

Best regards,
Abd-Alrhman Masalkhi
