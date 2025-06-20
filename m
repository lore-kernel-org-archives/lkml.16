Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6402405F9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460526; cv=none; b=F9TiRTB8R7xzLLmZsk+AM9wSxCzWx5IwOWlmndR3QmT23pPpihMliQQkJv/FvoPcyy6+6cOE6mUpk5mU0niT2fn50PhSB7FXud1xQWVr3nU37z2SShTvt9XIxQV4tIZKacz5wkgjnuA5jzp739IssayNufZ8imnxk6qdp7Q9ALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460526; c=relaxed/simple;
	bh=ZmhCAfFsbP8HzjXLpfEsaIh15zCG/QnRjgaSxbnOxz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMe1ZEXHCF5aQ/Ll9nUhRFmMdivflHBr3F1P7WZElyGlvdrQU567OPu+mGdPx7pGKD33AlIdnsNT96D6DbKOW0VWqL8LNyHlqsEiFvF7fDu66EsBq2DqPoVRzTTvhcj+vofcdI9A/nOLxxgFIinBdAXeUtQnHIck1ZItljccA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIOc1g/N; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIOc1g/N"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8259b783f6so2079200276.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460524; x=1751065324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/1QIWRbzRKxzNSeHg/2eVD4jkQvQIPlD9+yolNy+D8=;
        b=dIOc1g/NFvMgbDEPaR5MtIOI6opOkGxhheG8i55IHrBFY+BwZFQEguDnITD+f7ZssL
         zWpLIqv9CpN+YeytPLACJL6jjf55Do+C4BNTSrasHTopmNUyXr1zMFnuzFtx/Km4PlyJ
         bovSV9K9vYEiqGMC08ErZLDKiMzZ2kTv0mdsgEtX1iKdRuHz5puTsJOcom63gQbLEQlc
         XMlkTm8gDUHvodHl72jyY63rXmtvma6SwJtj+2cYXG4uHomT6cpvKMha+Kvi/93y+TE+
         qBM8MwkY66lZVOYs7F4UPw+TD96WcZ1EafGbGLXPkcxQvmHYZ4qiqLAV7XD2zgTSl61n
         YBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460524; x=1751065324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/1QIWRbzRKxzNSeHg/2eVD4jkQvQIPlD9+yolNy+D8=;
        b=sEzR9zLqEiU6uWDYp7dmp4Ss5KvyweHa+LvdE+S5bWGKT9RExIyTXAyHAK/BxV44ix
         4Xfp50m1TX/46hOEY2g+mLKTdFOzBTP9ADNxWhHlDtV82u4CkqVfhlAneQG+43dknG9j
         SSxGINv+OWrJnRwA6VOtFfrWm8fch6uS0H9/QG/hfwqvErlsPL9bzDHxkullmqGA6izT
         W3/IjLvd1bV/BowvfR4zTBHulN1BMvyIk2G7sQiZF2krjCi2h/4SMKvgXlc3hkwQU5D0
         Nzv+aNZKo0IC6y0jOArqhfcljVs3Q+JTl5U2vs86q8yXMCMe2nIhWiosfE3+XZPQ20jB
         6GJw==
X-Forwarded-Encrypted: i=1; AJvYcCXsDDuwem7G5FXNS/EQcC37OaqXTnTyQwAzMbMX+kBLcRG2DluswLsHtcw61lYEUKCTXMuQadHXwgIihCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJNjNE495Z2TRHLaUaK8jsj4U/G7kd5/9Dp37fHG5eMPAbISO
	KDA47BLXLg3ePSElDAxQyWowx0tUthvyFw8sy7lMNg14f4IyQx4WVNJxgYmBln59
X-Gm-Gg: ASbGncsiCqz1OfEBOUmgLDU3gExfTxS03kzxDExyZIlK7q3F1LWav1SGisyjVQ8t9D1
	MD8StG1f1PFkqYCSoBn72w2DhzpYtheZkrflFk2NzwGYMVBl+nbDiwMguGlAXpuOGlXk0O1xX+p
	y4UEHz1DrM36WcYoIHrlA4FN/N9FYVN3+R8zDBiUvFvqDNcKo6qS8BzS75J5q2Q9SXmdLrPTC9j
	vuihaAvfAUyd774nnYFHAnN9LhBhznLcbQBHAXVX8jOHpzb1WHhZPvtFA0MAY7TiBwJ9ftrjuyw
	NuJCZP9ZFrgWTzSPSQt1KMWxDZqOCokwjn/Su+4EgyxNnp+LlmrKl9+/yJfu6JIhhyqcPN5XoKT
	UXw==
X-Google-Smtp-Source: AGHT+IGX4IufRywQjEM7JFniXjofJ8cQ0neKxCM0222lvjekXAFNwhnvngUj9sfvXYaAfrKauKeUfw==
X-Received: by 2002:a05:6902:2743:b0:e82:65d2:5120 with SMTP id 3f1490d57ef6-e842bcf3610mr6063904276.27.1750460523581;
        Fri, 20 Jun 2025 16:02:03 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:02:03 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] Doing it for the consistency in the tree,eliminating the full path to the script
Date: Sat, 21 Jun 2025 04:08:53 +0530
Message-ID: <4ac24fc6d88cc4cc11ac6a4590562d23882deba6.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <cover.1750459100.git.unixbhaskar@gmail.com>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just try to making things consistent across the tree by eliminating full path
to the script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/find_null_params.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/smatch_scripts/find_null_params.sh b/smatch_scripts/find_null_params.sh
index 9e39146d2d40..a78eb7623fb4 100755
--- a/smatch_scripts/find_null_params.sh
+++ b/smatch_scripts/find_null_params.sh
@@ -3,7 +3,7 @@
 file=$1

 if [[ "$file" = "" ]] ; then
-    echo "Usage:  $0 <file with smatch messages>"
+	echo "Usage:  $(basename $0) <file with smatch messages>"
     exit 1
 fi

@@ -13,7 +13,7 @@ cat null_calls.txt unchecked | sort | uniq -d > null_params.txt
 IFS="
 "
 for i in $(cat null_params.txt) ; do
-	grep "$i" $file | grep -w undefined
+	grep "$i" $file | grep -w undefined
 done


--
2.46.3

