Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A16143C69
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839886; cv=none; b=SmwyP5a9yVICPV3NMxEM0H3bu494hXdhNI3MIvDfE7dhOkdsFHdcQQxWN3KhPTnZz0y3I834mtIfhMvkS2I6CrqOFo0Otys4sz+0kDKEJhls0LPkOKWw7TXhSN/OOIR01FFuAdulhbsNxSVx372gODRcv+JM/bhxNJm3NjCiO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839886; c=relaxed/simple;
	bh=q9tHTExnf3cNbpfcUNsJ4hfobtVJGEmcSXBRXYS0vUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSJrG+AkS/+9HnZge97CDly2KHCp/aqqLBySBOsxdfo28tgHmfDm55wfpXbcS7odnNUYVcbuq+8Cxu0JAHeKpZr3uSRuMOpLeZlhph6fnNCWJ5Rv29JLXafUnnyc8DjaS9gDgTEFuIkOoWUH+VCpbUB9doR/1XUZANpTB4kQZ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAQK1R9J; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAQK1R9J"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742b0840d98so3995092b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747839884; x=1748444684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9tHTExnf3cNbpfcUNsJ4hfobtVJGEmcSXBRXYS0vUU=;
        b=bAQK1R9JNS8CZGRJE9IFvb+tJ0d/Trk5/elAJWoyzHyre03Fx5QXAlk1iW04mEsbta
         aDLGQuvUK54oiFBdehSZiD3Jgy//uIO3uVYcJRDFtRDaRJPOFfHmgnajJRai5b4Q3CnW
         TmesnnczaL2sbsBBHMvhtWsRB67MUdBoCbrjw6RxnE8zxbFUSh/Rn/yvQvyjFcJlTa3r
         hiMUgR0sLOvMC8ClzoM8iJuoVKcM9XmV143MkXHUOUjMOKXJswgsLg7C5+Ew28ubB28F
         JeRTMoFkA0quEVMv/uvexauXLKt2bPQ4lvw/uaNL/X8eYPl1O5++UamAcuXguqxrNyqF
         Y0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839884; x=1748444684;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9tHTExnf3cNbpfcUNsJ4hfobtVJGEmcSXBRXYS0vUU=;
        b=AQ52Qxvlam/Gs5ZiT7bD4G7O8nf9bs3zgaT+qi1daJ0VerCc6za7Gp8wBX0XiGhOFT
         VgQryRDOLF+Kr7xZHBBnnEwUZQrJ+pMDjuggMj059OZbu8CCskeKxFDGB+ViRYHm76co
         JdHA++/uvp77Y4TqQXmoRSKvnDfej/+KzLrZ4k7dtNqTVaW9X1HQqxTWwS1fGXebATJs
         IomWGfFBl8agv3HNYHg6ICsMNyCvl9pk7tbx+IH/EZQeDJDeva032tr4UAuP9lQn2Tri
         k8/sobvL84T5gCdEXHTr9O82cMpJmyUSbX7hXjqOAjF6rOVe9hVtGRo77uO/Z3PtlY7i
         iPeg==
X-Forwarded-Encrypted: i=1; AJvYcCWj+5mQ02bZnhNGDXI/Yl1ufmeW/AJ9rt3n47HhB1kVvHTqumgysfN5MXquJX9OUuUhfzXp+/cNg3+RWrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJW4f8gp0Z3fvKM9sNCv3MZPZ/zBFGCt+vyXBiwaQI2yGoD8l
	Ovq8WsyjUybtPHSASH5Z84fIhjWTaaytY5n2ok9WJejy/amHIjW6K68R2O0HyEQk
X-Gm-Gg: ASbGnct05/JHvi/E7KKXHPDiYJRioLRnhgYHMLzTGN3oLnU6OhuYThsStbBmH0F6X7L
	/YwQradwvoK2+612GNUr661j2+ZgTr70CQZtIp+qzDOL0fQSlPjK25HTOJbAx/Pbw7Ke8N1NFLX
	a8QVfcJblvsaREu0rMtijI1DX0Pzk9Rj/uFyCQ24yCfS2t9pIri5hWz3TjnKuGkFri3f/L+3SN8
	2S3dyUpfeCjbFfdPPKq5eTO1uvUejQpBpSazvgbA3pyOjXM6/QW3yn9VCvHROj3vjMbgvfqvY3y
	Cl4LDPBDCz4JUG0HlilxiyP3KEwGPElMWRJPAfqIavl9hwg5zSwQ6OetYjdYgVkeq47g5EY5T8j
	+2+19uY2GIOJw4g==
X-Google-Smtp-Source: AGHT+IEjGUTqHb5NWIMvtvGZkJbc7R1HW0J1hE1aCq3tEY5gctFQ+ulCehqVQi+uXSiUTqWJAMnJIQ==
X-Received: by 2002:a17:90b:3f8f:b0:310:8d51:c427 with SMTP id 98e67ed59e1d1-3108d51c444mr6066662a91.0.1747839883716;
        Wed, 21 May 2025 08:04:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36366219sm3768202a91.6.2025.05.21.08.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:04:43 -0700 (PDT)
Date: Wed, 21 May 2025 23:04:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw
Subject: Potential heapify performance issue in dm-vdo
Message-ID: <aC3riPZ6GV/dlr7Y@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Matthew,

Recently noticed that the current heapify method in min_heap.h may
degrade performance when the heap contains many compare-equal elements,
compared to the previous version.

In detail, the new heapify reduces the number of comparisons by about
50% when all elements are distinct. However, when all elements are
equal, the comparison count can degrade from O(1) to O(log n).

I don't have enough domain knowledge of dm-vdo, so I'd like to ask
whether it uses heaps with many compare-equal elements. If so, I'll
work on fixing the issue.

Regards,
Kuan-Wei
