Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD9323237F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840577; cv=none; b=kTQESN8eEASnYMYSHuqgw03zMd1qwowEeZCMhlf1HCuo86wLyH1A+xDxDPRZUA6ADScqj5wn3SL5parcIV0y2vIUmxpc2AFFCELlG4JweraA/t8QO9COLUsQjl1JPH4JsxcG2TR9D617XcAKa/HHx9KALYyzOxvHtsuDIUfoTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840577; c=relaxed/simple;
	bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9TrRmO/fe4goiUIV65M0bveAlTku8Ochr+XkQMBrLVEeWaUgFdW0M29W8WmRaBY+UYeWvBaziTmEUk/7HWc1u2EIGhI2xcVJAa+mDa+xjmhrw3BGiTIxWGxv33GfHHDfZ+miYXfxh1kNqLJbrllnZ/rpS9tlFWQoLg5Vd4LnPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hesling.com; spf=pass smtp.mailfrom=hesling.com; dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b=Vexj+C7U; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b="Vexj+C7U"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739be717eddso51987b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1744840575; x=1745445375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
        b=Vexj+C7Ul07JQBq2y0L3MzXMGWw8lqcRiwvvv0Hy+9AeJ5BM80EP3vopa3KHzoXMtx
         dXacwweP011CQBSX1KM0N2hyu9wBxnVX+x85L0BlRLdbtq45VuVqskKjrloi8TGZAVCY
         B4u/hgDj1STtVZvIb1Bg0aOU6zTDciOOQ5XaaPW2OeqHTYUauJLWgWWoPMzVAZIPd5TJ
         8Zx450dbP419MinyygHSiSbWF7VypD6baQc69dQDP9mRiJC52xNvZ4hgPzTlq/QNU0kT
         BstyTu/LwMUEHlx/kO7D7Y/sBcKfZWeBb/cCQeJPNsgcSTsKYLd+cmvn4ZbWpxClfZPD
         BRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840575; x=1745445375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
        b=pRRD+pvxtz46mA3BW4Adqa1dorrkEiSSy9Post1rUnDDpJXvt2LgZxpFJWUVo60Gt8
         tv7olEpbF9sHaHB9+yxW8h1urdhzgFo1H6cvYQQ0Q/lR/qxU74hE0zjVsTulZfq8NwSf
         pxj2eESI9XlMvUeaH9QSE3VSOyXwPLbHh8FurpS5z8UIDsFkUDi/j219R8/pPzBCCuM1
         cU3daBHGr1A0lDPmjzbn/hReVvs6yD+wQidVSY50NjyQwNYbSCjD1Ftb0ItkHMwT5+j8
         vqUkJpv9kCNnzc5/iN4szExkroNOjCrV1VjOw3uqUkDt0V1K/IysQm+5q33gobbZNLEh
         z00g==
X-Forwarded-Encrypted: i=1; AJvYcCW5EN9jPiuBT63cgwIoIXeD25r/3mP5VJ+zmf02KoADZmTV/G7VFsO/lotf28Ifl5XeowqWvFBCUlVKjPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVeT2YpKZpkWw9bxXqQQRTkWW1x9D6GCMOF82QaXz6zJKCt2J
	+EC9T5N5vAWxvytrMpiHOTEhDceR/a5EDxYOMdLod4ubX1ndsAwNBIPooGtcyFw=
X-Gm-Gg: ASbGncvCWXE6AUAFR877lINbh9nmNlyZ4+Kilp8o6GrVj/Ybif6sJShjeUTQFtij/Yi
	FMkrF5UzBXbIU4VrTkRpCWMXTel5aXpq5DQjRKtw4ZAY92Qkt5nk6+ueDn51/sS+mJ1HasQMHml
	046vqa+jpTJcky7w/9geaiv5wkFLL01aX6QzsD3zP1wZF+D7DXIyes7sWIdHX4bEP8DFuaC06/U
	lUQ4XGytvbTFBUUPknkEz8BX8L9eDsBGsmNjnMmY5s6JAnayOO/bu+U+gV2/udg0fv3vFAg5EL4
	trMB0Qa+l7KQwXd9vSpFPI/Tpoeak90zs1e4ziakwarAMBBF/A==
X-Google-Smtp-Source: AGHT+IHNgzQj47NKKgEqJD5f4I6iY7S3hMdvrSvGtw/poQtKH3L1W5/yAej/xvhEAAGShLlDJSIYQA==
X-Received: by 2002:a05:6a00:ac2:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73c267c9faemr4932907b3a.16.1744840575375;
        Wed, 16 Apr 2025 14:56:15 -0700 (PDT)
Received: from craigwork.rex-boga.ts.net ([2601:646:300:8200::b8b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230de24sm11210134b3a.136.2025.04.16.14.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:56:14 -0700 (PDT)
From: Craig Hesling <craig@hesling.com>
To: johan@kernel.org
Cc: craig@hesling.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sboyd@kernel.org
Subject: Re: Re: [PATCH] USB: serial: simple: add OWON HDS200 series oscilloscope support
Date: Wed, 16 Apr 2025 14:56:12 -0700
Message-ID: <20250416215612.39029-1-craig@hesling.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <Z_9PssdqzDrAmgUb@hovoldconsulting.com>
References: <Z_9PssdqzDrAmgUb@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you!
