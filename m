Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC683C3C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837845; cv=none; b=Qu3IL7s2aseaUsbItinB4t1Hk1LyYKo8y8hscs+mhUgJzxKmxCLv/stJ12+I7sHnLRYBJHK6uerG7cXSuQRJitOHyAzAzPNJCQ4giHNgHVVK8n0rME20eXhbmOjNUr44UJpUuZ9PbAE9FOZiunstrg+Hs5UrGiIajCCz6ZDHYOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837845; c=relaxed/simple;
	bh=4QqplwpA/75dBq/HYqmGYp28sWeHvZ/FqKvL6YTZeRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Drf4O3+f55CLt7N06JulyI0u4ZwYTzaM9bqEG/tk+hjyWSYf9/bUcJzqKJLEfCywgzyYuvhtsiut0RMAlCjHkIPI4jQuoX//1ihE+MU2UtA5IbOQnY7S3VWJYRpno7LFJBOIarKQB+VHwAAm6NS/HE0SpFxqiCc6rSaL6k4hyZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHh/6FBJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHh/6FBJ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736bfa487c3so3757562b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745837843; x=1746442643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNArvwTq0yvkIYJQqumFxTenzSKLLwgBNJh9S3NbwjU=;
        b=VHh/6FBJwb8V2pUDVWjhsPwIt4ReEkGkeghKSF/b1jIEqTfqWt45IZc5BxmmqcxEqz
         CwcaAsHj6zAWPjfmoHx/Cw6c//3PLMcsn1Iebk8SulJhkfqeY7ZF3Tt12CfSmt9J/wst
         y0/S9z97qBDkL6W9ivhaAVgjGH6jZYo88AKIQqzyljPHiVXEXxU57QYTu2iRvcN/UtbK
         igNovtG1dBC9ArJm9/ZV4FJHWRqwxQtuWTzHXn9B6ymHAX3DP+9unWkcij9PjxwIaWmS
         wxJ7lp0KF3WousilEXKNxAc81UvfFQmESbmC6qls8rfgGKFj+2wQH0Q4ka5hlkCmNL9s
         2fpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837843; x=1746442643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNArvwTq0yvkIYJQqumFxTenzSKLLwgBNJh9S3NbwjU=;
        b=NABvz+wBp6TAlFOh7MTWtCduAS46Meywj6Hkl3WpHKrqLuV0Zs8wqI6LZ9bPy0GRL+
         AJbMHQyGDzoUNhfIusjy46mJumHyFGFNg8qdobr+uJKu79Yo6jbLCLtansRDz7w8hSqd
         lj08zrM8wyYRsvz9Up0/U9cB+NKk4HPatY8eRtBQKfVct82+hH9i1WvUTfCSFeQ+RNlW
         NZVqhGsLwCYNQejItDOz2oD+x9lNtY8BJPIb/2Uh/ToeoI1HrUWnFRy7Og2LhdSy12Th
         xvoeuUgQaEDOe9mUjpsIxAxznXpnHna+JtvcNp1IgaJ2vjHJN92J8yXUpAjq/uRWv6AN
         NAqA==
X-Forwarded-Encrypted: i=1; AJvYcCUt7nR9jK6cC7MLGzAiDUKkg10hw2vZwRcEEI7TRYUhmlxZjNt32v6Pw2uqDsTf8Efg9pu/tOD8vSb6YFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynYi2yJ2O9MIS0eSCIuUzcR6bvInkHvA+tUTeCrLYLozFTVykK
	2XNLMvBFAHjxLaRC9erJMahFYmxUwNXjZ8A3EeiIn8IZDuuTPT7h
X-Gm-Gg: ASbGncsdlnQ//Fg159L8jcMQ08ipxHPd+xkOQ/ptWsyBIvD1aztmPuAZN/YzYNCiijY
	cCdLSW0R5aWnAEManxQmGFgYL+WZarpQIIJlc0Wa12ftlDm1hfkfMMA4JyHnXbiRIQZhUAHFh8H
	ef3cOiXpCs1t/T9ro/QMLh/eDJqwJnGwqlho8duxVKY9hzVxy5DigL+NGaxMnsaCh+Azq9bGlV7
	XIzS9vbglYehor5jTZcvTKDPuZy2EOlJaAv+nfWb/kARQOYjLERdxoWNOPn0O1qTcLavhDAwnH+
	W4xO84rRf01zfDGUr4ZJrqnx4fMQgv0ln/wOCvI4iQ==
X-Google-Smtp-Source: AGHT+IG4/ZjVPw0sj/Bc6Q2b8qiqvWDcd9l/hltQbkBrgTKyeRKzqt2pe7a+CDHY+L3RVw9LWPOT/w==
X-Received: by 2002:a05:6a00:130d:b0:736:4fe0:2661 with SMTP id d2e1a72fcca58-73ff72af24emr10649336b3a.11.1745837842880;
        Mon, 28 Apr 2025 03:57:22 -0700 (PDT)
Received: from pop-os.. ([177.21.143.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941fd9sm7925210b3a.53.2025.04.28.03.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:57:22 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org
Cc: andreyknvl@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	surenb@google.com,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
Date: Mon, 28 Apr 2025 07:57:16 -0300
Message-Id: <20250428105716.151167-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427172551.fbf81f14d4e6563c13007a65@linux-foundation.org>
References: <20250427172551.fbf81f14d4e6563c13007a65@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andrew Morton <akpm@linux-foundation.org> wrote: 
> > the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
> > HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
> > of the MTE the memory words for storing metadata only need 4 bits.
> > Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
> > define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
> > so KASAN_TAG_WIDTH should be 4 bits.
> 
> Why?
> 
> I assume the effect is to save a few flags bits under some
> circumstances?  But that's just me guessing - please fully describe the
> motivation and effects within changelogs.
Ok, I will change the commit message with the "why", and send a v2.

Thanks.
