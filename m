Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CF318BBBB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818809; cv=none; b=i5j8+q9RUeDsBal2+hlx1U6+z6lROl+3rfr4Ydq0KlYXDhm8LEGGYFJabxjzBbs6q1U+71dmLzfr8RtA415+2wWwYmXwng+qXdo67VVoAXagFTeja8SftH+MW55Wo4AhDR5cqC1lZA/t9WZJLrG7D1u3Rpd50AGEnfH1Xh2ehYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818809; c=relaxed/simple;
	bh=H3PzNC3xIhl0GKYFcLaLS3yXa7lBJR6UI7k7WiHNrxQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SJItwJ5Twwm4zmp4m+4xzIdE1dYavRMZ2YiBJx2psXck2Dc/mX+G1WBZd9KoBG38lGxaXUXk2DdZ8lqfgbXXpj1FgJH7svxMC9DZpWFnXVahcYzQ9laPY4GmEv8MFcT+/Hc18SDOZlOlc9zlqAoQQ+hrhoWr7ZqlsE16LSoXDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3128086f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 22:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745818806; x=1746423606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODFreraoz8xwp2joxLm36YvpQAUecMaSczh29u2bx2Q=;
        b=bjf2UjO71W0dnnkFHSRTZv+88s0Ax9PGqCpEEptQLuew081Ypxsfq9droJp4xpNh5D
         s/k5eN/oICsJbANsE2QJQujfiFyMaEns/pGzkgcYvEt+AcdnU9s8uNHDf5LNcPh29is+
         RzApCxJkd44ap9o5zNoav8qJomGUCP9erSsBT8qzMqPeolbNnXksAhrlIS2R+0rKMhxt
         d9cfDXdo/Ku2wpy/aNljOrzLJpH0VaXel8E0NU5TwX+uNNUSrbUQm/fsCjv90Z6nYUV8
         7qZpkp9CUPjvlJS1cRVIS3z6qg0O0tZmsJkihqK6ddhVY5NvJePpoRl5pC8qfhAP9UG2
         571A==
X-Forwarded-Encrypted: i=1; AJvYcCUVkH2eKyQYEULGIVVGB2vsP6PYkwO/jvXoSpfPpTJ43FONaUG4v9VhQpHS0Z3q+OKKjNVvFpxVxJOWeDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzJJnh8SW8dSlTsFBvkgq4mLs2vylFKT/Hufm0H2s4DMOhA0R
	DuVQKguyeAWAVB1NucVPvz+xsbyayUtKiLgDNbl1XzR2iH3MyV7iPtbo8JrA
X-Gm-Gg: ASbGncuyixvJIrLm1UveZtdCDNlCWG12H3KnuQNWy8JtTLtNPjXfxPAGEO9NTuEpXMn
	QZRYJMUQeWfgkWH8LGlAHO7nEp+9OVtcKza/K/QiGeLJHzPwQux73TtRjGfeDcXJfTLcy5p1d9P
	xNYOZqp0i9QU6tJkmiXGFsQ9B1Xb9cS2BR1H3kLkaweRUpW6GbF2EDiRLofXaxafKwgx5OINKmy
	lcGkT4oRv00XkHk+7Bnd3LkRRWq0ruug6z2ZsbL0x79vTr8Yhfs82SZHRqNewLCqFc141Ut//Ds
	1l+ppj79yHwIg2xjHgE/kAVN/gHhdZCz/6Z6FzbwPXmkle6CvJRbqLc=
X-Google-Smtp-Source: AGHT+IFE8wKoBgBrSZvbT/aWoWWI27jmvxT9toKX9l+1LXwKfmg4jDTFGgvEC8ibUWGk7B/F7kbZgA==
X-Received: by 2002:a5d:5886:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-3a074e1f385mr8397682f8f.16.1745818805584;
        Sun, 27 Apr 2025 22:40:05 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e280:5300:9068:704e:a31a:c135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm10118590f8f.32.2025.04.27.22.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:40:05 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Costa Shulyupin <costa.shul@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1] scripts/tags.sh: Don't tag usages of DEFINE_...PERCPU_RWSEM
Date: Mon, 28 Apr 2025 08:38:59 +0300
Message-ID: <20250428053907.2851864-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For each semaphore declaration like
DEFINE_PERCPU_RWSEM(x)
DEFINE_STATIC_PERCPU_RWSEM(x)
ctags generates multiple DEFINE_PERCPU_RWSEM and
DEFINE_STATIC_PERCPU_RWSEM tags for each usage because it doesn't expand
these macros.

Configure ctags to skip generating tags for DEFINE_PERCPU_RWSEM and
DEFINE_STATIC_PERCPU_RWSEM in such cases.

The #define DEFINE_... itself and definitions of semaphores are
tagged correctly.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 scripts/tags.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 98680e9cd7be3..503371e59e366 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -271,6 +271,7 @@ exuberant()
 		ACPI_EXPORT_SYMBOL
 		DECLARE_BITMAP
 		DEFINE_{TRACE,MUTEX,TIMER}
+		DEFINE_{,STATIC_}PERCPU_RWSEM
 		EXPORT_SYMBOL EXPORT_SYMBOL_GPL
 		EXPORT_TRACEPOINT_SYMBOL EXPORT_TRACEPOINT_SYMBOL_GPL
 		____cacheline_aligned ____cacheline_aligned_in_smp
-- 
2.48.1

