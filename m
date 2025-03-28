Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526EF1D6DA9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187158; cv=none; b=fEVO8SWKA1siV/dUjCQishM//4809kHSIYZvK3m4bLEVO8Ootuhm7pTnOVS67X6DnSU7Q43AqLI6JeuHERv7akmQxupV5mCp4a3WwOzsT0niVRMnudbe1dXay2WrSJkSHOdxrdXXvHAFJQALmPGnRxeWT72dtFLvNxbosddaNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187158; c=relaxed/simple;
	bh=czbG23Aa50YI/FrxMSLQa2h4iofZTF2kMV4rYoe4N9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=RU4s9/2jAvWPo4cIS6NxZClkX+mImgPQgm2e0jOxKkIQxku4nDpkW6AtMSAb2Zk879GOUERIU92tOYCajMUGuV6+Q8mnSkjMz9339xMq/AbOmo8fXF6qEm5r+iTrCaTXBVFwJbAP4cB7HBpLfqHtcxmtWR+YOpBTbotg7FBGXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X8SpLM6U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X8SpLM6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743187154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SJKuNbmw7oC7DLUdI0HGCSgW0+TPW+f36kbISYsgi4A=;
	b=X8SpLM6UwDQibXPLe/iHJTUER0lgKCIPAyyk7Nt1aUwpTAGlGEQuKPTh2yP+WRUX1eFkwI
	aounYQ/7/QWMTlWiPsytzKvsq17vbPs+p7fJrNfMNsGJT/riJoBssHr1YI4a05DaG90TEc
	LEGexG+TOM+tST8m6hCT+3zefEGBK5g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-dyyT5TwoPamDiwRpP9Ycpg-1; Fri, 28 Mar 2025 14:39:13 -0400
X-MC-Unique: dyyT5TwoPamDiwRpP9Ycpg-1
X-Mimecast-MFC-AGG-ID: dyyT5TwoPamDiwRpP9Ycpg_1743187152
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7bb849aa5fbso501848585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187152; x=1743791952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJKuNbmw7oC7DLUdI0HGCSgW0+TPW+f36kbISYsgi4A=;
        b=ettMaMQOK8rEGHiKtNvXipLAPQPQWj0K0ou58yiwrcslAQUxqPzVe7p/8iYHsLTOv4
         ikdnR6ZXw5hHQ2mzuV4hWfJW9UjchqqoIqvLa29vAdY2SU7SzryN+e5HkGAm9JbcCJXR
         HSWPUfWdwbeQjWCqDS5ujY5j0jPMkhhLG9HLXzjGWp4OtUQ1RMeJVL/kbYieUorJLFbw
         sxupN1sFJKm8utSPKPfSK7OqTkL+0O8NvFwn9GKwyldQP4fDhjeFAnFSBtj3YebMyoPY
         btmRiW+SfyWpx33Ak61f97qE6SYJ+7xDIaEeummKOO1pQvXNPwkcojCRM6PXfF+dsn/4
         IBYg==
X-Gm-Message-State: AOJu0YxuvSRJikWeRd7v2fxHkDhPDPmlq286szI5XI46YurV5YZtWl10
	Cm4asuxHmFcejc4xonCH3iLpEsOzD6Dzu3qhMxxurxnshD+yevMrtTbumefpms/X/eOXgFWCZcY
	MDHlP0meKKTWo0LJS0OV6g6MYwUlxglLOKlUPv6DHNZyNoJzoVF9/ACRPoYAeSw==
X-Gm-Gg: ASbGncuaN3lmoUFiNRNXeH5ypZshM/oRehtaQjdDQBsqNPAtHPdGrGSvOmT6Gn+xyaz
	foetv/xZewZaUdc4+zPAFUa1orhGM12CWcnH+fov/y80XNP+E3u+GqfOcS2jC/m2/KNQor+R6Yg
	jFnhppujufGLCwyMQpWreh+40cDL53IArnQ/CERukJlbJ8CB5px6g9gpqf5OR7qFrw+oA4owlbu
	JTtpeWvpG8hNvoLhxduYNtkJnqh/eGCxEFVP1djCmSP8Lb2qbDVhyXZt1GvUfNbAAUTxOJPP/V8
	T+29JLv+YmGJ0tnfG1HUqPSmvL1DYXEqIm/9Wg6hhw==
X-Received: by 2002:a05:620a:4555:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c6865ea80amr18436785a.23.1743187152215;
        Fri, 28 Mar 2025 11:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0/tGQn6PX+InznZllOicvlZFfe9sFTdh8a9j3T7npXQZgGX61Q2VsneZY1EaUJsIExkZ7GA==
X-Received: by 2002:a05:620a:4555:b0:7c5:42c8:ac82 with SMTP id af79cd13be357-7c6865ea80amr18433585a.23.1743187151806;
        Fri, 28 Mar 2025 11:39:11 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec964649fsm14276836d6.40.2025.03.28.11.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:39:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mhiramat@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	aruiz@redhat.com
Subject: [PATCH 0/2] tools/bootconfig: allow overriding CFLAGS and LDFLAGS 
Date: Fri, 28 Mar 2025 14:38:56 -0400
Message-ID: <20250328183858.1417835-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Allow the user to override the CFLAGS and LDFLAGS similar to what's
currently done on other kernel tools. These changes allows bootconfig to
be compiled with the hardened compiler and linker flags.

Brian Masney (2):
  tools/bootconfig: allow overriding CFLAGS assignment
  tools/bootconfig: specify LDFLAGS as an argument to CC

 tools/bootconfig/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.0

