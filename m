Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E336BFC0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747782995; cv=none; b=Ome/9K9VsNAK3gr7SXiMlMpfTDIyWyVLCBnPBDJnicBihoefQdgYRZG88biJRlGM7ig5EjF0TRkjFZlZWH4axBpeIXEbNaUBfN9qaQhfK2029aToSqgZL0JsKc5aKYXXCuBGkpdeQZAhGGEc4q8QaGVr40QIUDZXFhWy/emy8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747782995; c=relaxed/simple;
	bh=rDgxYnBkRJB+1zOuCX7vDBamF1MiiKlcC/zm0HukGT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sERmDaGO2kTyZ751+ufVH4Ds5F1ljLOXnwwtLK9S/hhzneHhWjEgu+ONKImBlhRPsF9P0NyaNlSbMCT1jxyla2IoOnwCeDYYLqSJN49EsqT66tn8oIPSruyX4zaIIRyiosJ5AUqpVHUZPd92JZe6y5sesAhk6ei7J3pdSHgoYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=O2w3not/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="O2w3not/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2705e3810cso503856a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1747782993; x=1748387793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDgxYnBkRJB+1zOuCX7vDBamF1MiiKlcC/zm0HukGT0=;
        b=O2w3not/ZnOLCBnvalBFJu4BORQdbszVYIWpoW2Qz79iFWXk3oM8MwYcQ8xIs2K6Wr
         WNBC3uoz6fen1CfFijcHKJhls6QAteLHpaWhgmvt/moX4ssfOB6T3h7VHHTUXT2P6Myv
         nNUGhk3x8KrvRV6wLEAsBB7/LJhMYSpyQGzjnhRb1Thnh8tn0O39RCmlrxcsMrC28bQM
         bSN0zrk4Gi4VttKDzTNKC8YdjSvzrPp3mtM40cM0bq5gXAG0rPGPljyu0iil8Xs5LIbj
         mADQrjUqF1Ztr5X/GB6yCRUeQbSAfiw6VvXX/5RnrS3Oxn/VW0tZf57hDic4bVE817lM
         xatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747782993; x=1748387793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDgxYnBkRJB+1zOuCX7vDBamF1MiiKlcC/zm0HukGT0=;
        b=c90Ng/0DOrZHq1ChMeY8GSFfWK+yuib3WvSnIE5JSEzWGV42r9H1rpCT1KvsSG09ol
         4J2JuGfyVKW1BvIIfIgwIBUbKSmC/c/QMt0NOp6aDspEFg6QiabKT69CLqb3rFttc3R/
         2zZbgOgLNfmZCEbjHMOd1DBZph7Tq9mMoPAKYYkokO9JJzL315nxZfmevQovePgdlvps
         t1L0T36QCQDY64nUILqI0tyDi53UcSTG21L5o7rzg+Bi6lfNkFRubaD7F9EYW4NR6O2J
         lH2OSgXmuNDJ9GHuu3N4b4C6XbgQORbW4CQjKq+oAvOxH4wps8KqXY6He5Cb4NuuKHOX
         LCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5oDuqOoGc4v5VkCTQNskLT6PEmOcmk7euVjE44kjUSSm6UpLulCop88XzC0Eno7WFx+u1QxZTQ3uC9ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjgD+QpOgNS7CLRqH5QRS6ElAir7uGO8BoHKtLAGEaY4ln25W
	QxQg1qg4ysWDeu1elzdmSj2xGZi2h987AC2eDfPQywEh0vK/NIpNQZmNJR7xaHVAkiI08YMnZyR
	zuJiY/oHd0w==
X-Gm-Gg: ASbGncvf+XSLnFA4s5Y/YbsolOeD1gmPTT1N40t75mPmUeLjncb50jBqQqfBSsDrUO0
	WCmHtQ2sDXD/R1rbnr+Vrqvy3ZAgbrvASmcUiI66SETjpC0QnH8wh/Bgh3cKM7n6Qbzj5uNBH79
	r0Wr9jEJl1tQ+tnhUrMEy4Q5/okGunYAGt3xoDiTx4Jy9CRiMbGbhN/BJ3yvfvPHnU7v7lYQV11
	8A4qQPXadsOWdW0Rz9fgQFHBUdcM6xHjNVr8WhoHOeftif9ECE6u42JWqvMt92HujqtKgNjrPEh
	JPU4CH1Bzgn7HSc49sgADmAczx09tkx+SBYmi0DWJ+gK7oeKTXJeNeHmcx3DvOu51pYdkQ==
X-Google-Smtp-Source: AGHT+IGYamG6HaTsERBMJNn/ENfW67B+S/t9k+EMR2zfKNVUCVgJpKNQTHLIzDBFZyXXsOew65kqKQ==
X-Received: by 2002:a17:902:d4cd:b0:231:c9bb:6105 with SMTP id d9443c01a7336-231d334d214mr98532235ad.0.1747782993056;
        Tue, 20 May 2025 16:16:33 -0700 (PDT)
Received: from dev-cachen.dev.purestorage.com ([2620:125:9007:640:ffff::9190])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-231d4ac9510sm81858585ad.8.2025.05.20.16.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 16:16:32 -0700 (PDT)
From: Casey Chen <cachen@purestorage.com>
To: surenb@google.com
Cc: 00107082@163.com,
	akpm@linux-foundation.org,
	cl@gentwo.org,
	dennis@kernel.org,
	kent.overstreet@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	tj@kernel.org,
	yzhong@purestorage.com
Subject: comments on patch "alloc_tag: allocate percpu counters for module tags dynamically"
Date: Tue, 20 May 2025 17:16:20 -0600
Message-ID: <20250520231620.15259-1-cachen@purestorage.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000739.5930-1-surenb@google.com>
References: <20250517000739.5930-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Suren,

I have two questions on this patch.
1. If load_module() fails to allocate memory for percpu counters, should we call codetag_free_module_sections() to clean up module tags memory ?
2. How about moving percpu counters allocation to move_module() where codetag_alloc_module_section() is called ? So they can be cleaned up together.

Thanks,
Casey
