Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DAD197A76
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513429; cv=none; b=EJekXmfG4IgxGFYyG2PFyL8WzOWbZlXJdUQNccVSs5lGvEWURkDQpP6xekB+XI17iKqR76j9WFl/RDhx8d/APJiTY2iSQVw1ZMMfhIqt0aeZAwSggulxdKP8/S6axBeANh5F/HZ9vVzVC5QDAjiRnhrK7VoCkOz97JlVge7lH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513429; c=relaxed/simple;
	bh=/GauZHo5QrgXjmQOBmZ/p4hefRyYd29HpCzG0NTz4Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6Dku8F/D17MMw7DLAJOv8b8s247UaV8MwbKXK8tkLAOTb9nwXkgD9MC976xYZnafeQiZy8iEEU9u64+Df7kHeUgxNhRxKjZ+RIZB7QyHLpX+qV8EgiEOqmx8mY75Kf9TRAHs5OpfZFCE/14qjS3pQuYK8evslBJjKKTRmQBGcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=EsEk8cxN; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="EsEk8cxN"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2d060c62b61so950996fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513426; x=1746118226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=irqP/fJ8dLQK1ES9rmqL9YT2JfrGImrnE/KpnWMXB4c=;
        b=EsEk8cxNz2vVC/puk7OcQzyh7goDaizuBpc0voYUbrBJpuZ7jjoIAIMVz9VEkRZ4Nl
         hvVBKXoQtb5ywOLVUu4VxB/UgbZZ6SzRGJGpv3loJChCOUSDaePcXdNwjj6eWatiDUco
         I6wz1dc90ZPECghRFJW9irEpBOOGi3GKbYjZ5HuDMJtgEv7awvQJlNsWa8p4GFHhAfYK
         BY7Nayic5o9XItWOSXI9IlT9qThwDnGbwWgDKLq/nN97juf9oMgG2W7tzMbrkvUD0db6
         k8acC0+YTqkaOXlrXHVhrPYovODplGDGKLDQ2lzPaMk5IhlqAquUSiHgn1fnc8PYlGyq
         EaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513426; x=1746118226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irqP/fJ8dLQK1ES9rmqL9YT2JfrGImrnE/KpnWMXB4c=;
        b=q/QtQartTeZuj5unUa0nu/uNqRZ7Lmnq53MFGIE3/3XuFyqAQT2iZvmVEpOwigfs8+
         Ojnqkrh3jplUKIBNLsad8pNUqnRQjo2QEkDewofvcZuHdZd6AK9S82J/guUETxlTK+eO
         TMQ+QduJ+W//RDLhnd9oeDlR/6mTSQoFb4MEtFzMRbdoS9zi402KmPrM1BjJWu61+7D7
         coT0VBIpQouOYHmH4c7nc1jBdrAx+AyFGQDl3r0k6x/dFiBwq/XoEjMtLRjINtW1vEhm
         RRp8/I8l7/Cwxv+Z8DFnty5us1u1iFkxeRiQqpXkuS4bTUt/HXsjViw2ejWAIeaP5VO1
         9Eng==
X-Gm-Message-State: AOJu0YzxRYRBuck+ekgQhGMrOX9RpJLxbo1cANyoRRVvQSHrw35KVoCS
	40zvyFnETPmjsILTZn+LAaqYdSDf4n356HuydEer75Rn0yaxpukzoaKvRga+XGmsdpmS7HV2Rtx
	Y
X-Gm-Gg: ASbGncsWLzx0mx/KYLE7RIQrTs7bEpzk1w2TQrSv20n6v4sjVnvRF+xpc5YmMXVUwga
	cx7fyflZ4Kslcd4uVv2tfmU+xa8RJxoHV7gTR9vfrWV5Uo69DXzCCtFgE240STqj7FgotZcXxwB
	UJpqGjPbynJk9dw59Eit8NfQ/JAbc4cIPadVc9XO2xbUYfz4qj/Cxiih6GYvvqpg8J4bYXbRx83
	AKiuxO7JkE23fJucxesn8OBPE59cMIzR2KhIXKLuJOMB7pszE+kGW2LAWBYh5bVRD1YDbSPTZAT
	Hs8s1iyJsKbAu0DY2KKvZcPNxqby0LP20AY=
X-Google-Smtp-Source: AGHT+IFI5A1FFn/q4E9plQOCPB3xcIBLhIbNwEPSnznmLTFhyxyKrEh1jvaOGs0nK04Q3S1k9Zl6qw==
X-Received: by 2002:a05:6871:2b0e:b0:2c2:d749:82d3 with SMTP id 586e51a60fabf-2d99449365amr274841fac.27.1745513426395;
        Thu, 24 Apr 2025 09:50:26 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d97364d9c5sm367930fac.7.2025.04.24.09.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:24 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH 00/23] ipmi: Remove SRCU and handle the fallout
Date: Thu, 24 Apr 2025 11:49:37 -0500
Message-ID: <20250424165020.627193-1-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set switches from SRCU to using normal locks.  This required
pulling most of the IPMI message handler up to run in kernel threads,
which was a good thing, anyway.  It also handles some fallout from
that change.

I didn't have a way to thoroughly test the IPMI driver, most of the
work for this was creating a test framework, which required work in
QEMU, the OpenIPMI simulator, and a few other things.  But that's
working now, and it shook out surprisingly few bugs, one in the new
changes and one driver unload issue.

Anyway, here's the first candidate for this.

