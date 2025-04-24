Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83A197A76
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513449; cv=none; b=Iury3knWoXR+UVGQ1gzV7gmYxcfpCeur2opzQOOwt5p99PziTJd443Qcmbp9k12FdcpkAl41GZ6ta6x23d4LGUJ/u7HGyPnC8jUm5+h5VgcM7lYqLJnqn1OnBwqj4PpxCtiPN388pso4BiOPsHvjf0NTdgTCgrfCjzrced+noro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513449; c=relaxed/simple;
	bh=SQ6vcpjxjqiGrMHPluDT6XOz9Z80nQnqZkicTUONgNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbramhZvq+IO0Y8YxGSg98+hq30/mfMLZjvgakk1qB/4e4U7NhGDJcnpiu5bBXYXqz8gNxpXJylnTKZWh1UEc2eFxtrCUTUYq7X8cuvcqTbn59qs2xdg/HOxkgGFGLoPHECcNWWqqqecCfBn/ZptorhWdQc1+NWpR/u5dK9HYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=c+/V4oTc; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="c+/V4oTc"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c2504fa876so306621fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513447; x=1746118247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUz7DXMA39otnLyfDSP3DMy4MLC8l/U84/KlxK55hqA=;
        b=c+/V4oTc2sRjNyTQJOrQQS/qXje7hzKng4qmObtrsVGhqwzn6DutxcwH21KVuP28Pf
         pOW1Vk82j+3YOzYjQmi4UvkiDTiI7E4+cnLs8VRnr7UGM3cDMs9IsWCZeCabNTcc0HzR
         XGAynS5O4H1T7MzP8UOjT8ghfPA/+9C/t3QPcnWrU4GuNUMFWwVbSPghSZ0+ryNEM1fM
         H7vmz6TPjCqPXZVyrmNDb6ninfS6PwwvX1dohSYOU1UE7z4N75RAJRKsV8tzrZwZZJBK
         mXtwZz4tnPDSSKI7hcGIyXrtNtoAkeqTofEE4wCoH5Utq0X13Ifudje/MAnnAyd0t2Nt
         EUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513447; x=1746118247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUz7DXMA39otnLyfDSP3DMy4MLC8l/U84/KlxK55hqA=;
        b=wKYH5Igneekye12MQqROeMtoB386cn1t56RO4B+V+D/IRcBcNt4nnfEi3ncijQs1NB
         ZS/HFWaWHlO+lYen1bNuelOeXSkx8jluzKj+e95S5WzLlWtkNtNJBv0e4R2GawRJv/Zz
         blFL/L60e7eV2g+y78J+kK8W8topnyZH0Vu7SfonfiiKq2O2PiWYKRyGblWkuls5kyI2
         LYMTn8WFWIXzau2tkTb0qOyly5n7RhKpWo2C2dLdrdtlGMMGQaQJbk22LWMhOyvm6oP8
         EloxQqn6hMMhD6Nwo05yg+8AhdBma54oJ23dYxbPx5f4rqZNxAMIKBJefnWPfnBbpotW
         tBww==
X-Gm-Message-State: AOJu0YzJNUTcBv6lcGDHYJbuIdVAPVPJvZ3wu1LxcPhr3um63l6a+Zks
	2nGOD0hTSxFxMKUPoHwA6576L896um0EGAfIK7Z0Me1t1SDwd5ICKBnaZ7SJNzXB7yKmh6e6jxi
	+
X-Gm-Gg: ASbGnct+Didme396x2SRqXcK4459LhATq8NrCuw0Uf3mcs5xxFEC++n3KA9B02tehrz
	izcJAiYUlfugxcN0BSxCiPOSW0GxaGIkCwaVX6ivDsRIXehuLqyUfRX7cRvxVPkdrmDe6cjDaOd
	+slaHbB2wQphQnPDCYSd817ioAPZBJrH8Q0MP2Ks21IbY73cWY1UDecXXgzo9Haq8Kd33HnSO5O
	oiJLWott9K7BZmbPPkvKW1PvTyIA/S4lW3+u5xf831QTShq58qJ8szhQnVbia6bcSvpXT3uBiq3
	hmf/nZ8Puz4uyHBBkdVtCwnTD3Ng0wzbTes=
X-Google-Smtp-Source: AGHT+IEFBkV7UHEn58Xszvm0tfXkA82Ab6TrMIvEXYPdUN5UB+Wy6GEu8BwlPZj7yfPnj9aDzbXcQQ==
X-Received: by 2002:a05:6870:1592:b0:2d5:230f:b34a with SMTP id 586e51a60fabf-2d99420d1b8mr332806fac.9.1745513446880;
        Thu, 24 Apr 2025 09:50:46 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d973650836sm361584fac.9.2025.04.24.09.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:46 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 10/23] ipmi: Add a note about the pretimeout callback
Date: Thu, 24 Apr 2025 11:49:47 -0500
Message-ID: <20250424165020.627193-11-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You can't do IPMI calls from the callback, it's called with locks
held.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 include/linux/ipmi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/ipmi.h b/include/linux/ipmi.h
index 2f74dd90c271..27cd5980bb27 100644
--- a/include/linux/ipmi.h
+++ b/include/linux/ipmi.h
@@ -93,7 +93,8 @@ struct ipmi_user_hndl {
 
 	/*
 	 * Called when the interface detects a watchdog pre-timeout.  If
-	 * this is NULL, it will be ignored for the user.
+	 * this is NULL, it will be ignored for the user.  Note that you
+	 * can't do any IPMI calls from here, it's called with locks held.
 	 */
 	void (*ipmi_watchdog_pretimeout)(void *handler_data);
 
-- 
2.43.0

