Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE413D244
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940693; cv=none; b=WxAWDXVVGzC0yrABg/1F77rBI3to0JeIe2RleqIvy7uKT9ILnmczJNoiab2ucXf8MFQHSnbyB/MW+lcyB5PClCdgRi43ktUer5SAyFgwxu6rxSS9RClUzebo0b2BbwTZlJ4+i1lFp4ZLKhIc66etPDbF7qFpgzGagNpIWrZfg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940693; c=relaxed/simple;
	bh=WCu+d1nWgNWmEH0HioNi7/zlQOZ/COPLsZv3Wg+nOUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wn5kcH4ooSqv3/eYyBpP0iZ5sQB1YHTP1T6xSXPEovmJmhxa8HHGElcKIc7Pxe9w96k/+/LpdPPkZZKAwXBPjy6R7PICP+SnpwqwAhtgiGl0c94mbFQ+SCK/Bs/q/3dOOdIA1TT3Zhv8618T/kgR4xn8u32eMaqRss4q+P8pYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCpuuua3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCpuuua3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216325f516fso5118525ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940691; x=1739545491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iVGjPWgKQVcqmfxAXvNxw3qO1+HIN2RHmNMdDjIM+3Q=;
        b=QCpuuua3va9Ja+QN+3z21FbrlnkoybxfCeYeXq5Nopg3slWneM6QgL5XgPvU+7I977
         A9kDhVjERKywHBVMGIa5wFtUVNbJn/I3+FVdJt3g0swA0vIcjnq3efBKeQaH8kuxrOd2
         Gk/8uJeIRSHnUss8o58XW8lgarukldc8BdQMJi1agDakiAYMSjPG3BKWc3sDSCDBHoXo
         /H8xFuQ9sjTzl4Rnxuy1gnfGPJJexrp9MUN6KtUDYXHOVKndFDvkZxRPNANGQd0CBLGk
         fC3FnhCzGOM/+fmW1zfMf780rmY+fM0ULJRRPVljF9QTHCKRUpvf9oah5901S5QRUU9G
         vfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940691; x=1739545491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVGjPWgKQVcqmfxAXvNxw3qO1+HIN2RHmNMdDjIM+3Q=;
        b=ppeuef8UVrMaUGXZSOgb7EXzBBh6kK6QPCAhSTPb8tL7zM1ihwd0U8pXFJ7GDq+32x
         PtaBFV46T2APR9gYOf6GmcOz9tqix+2M9GsAIB1vLRhE/UG10BOC8AFh4So93EmEpv4T
         nUR6RqDT1bAsLANH1xbXm4EpwB/JjyCKXo3CIUhT9e9ha5+57Z7kyrR9oiwlhw3B8Jzt
         Y7ekeRJJthYcHA/XjBqj3PLriJTniWlZ0BrYoqpXEqvW/ggghZAxHEOEElnozKuyWtRv
         AQDJlOYN8ui9cNITzKHY87fYYL0bC/SbTij2JYQTYUH7Y/S8bb98sQjTXVjbSkKnTq5f
         jDyw==
X-Forwarded-Encrypted: i=1; AJvYcCVMLUEnra58ApNTACKN7Pr25CPDfADAP9hropREK7LoCkjZ7LUBuzMwFxNtlsbKyQYlHEI5TjLtfpkUqAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJmrZc6f8NK2dNKJtfN3xHXjs75InY5uVV4CrXVW0ogVIbRzg
	pfK8eoYIu07uRuiW/Qymp6EB8E22I6ukHYMQsV1ExTaSbeJaUV6A
X-Gm-Gg: ASbGnctVFK9M7va27h9jG3VkaNyjK3umQB4q07pQLcKr/tv1iV6ZwjIWVudB7uoW4PQ
	J1wFIYxoe+YnEzDxJbuhCou6xH2MLzJ07tTnFeXZ/TWHbq5IuBgKi5tqhPJ/A41rhlz/FSSxKgv
	fVKXhHh8USnI2TcKrCHfoYtFM2NqVGBHtYLGV7oNW4Dj5Ap9ZwpXUcXXlS/BF/ociEJ1lxVqAj2
	dtLO61BX77NsVRSW3NeXSO+r+qxEYWJnOnCxq89G4gVEKiFnJcvui7pu4PeBHr60n7E8NCgl+PS
	L7K/Q1SWeLXZLAJvvxo3XwIke5Dj
X-Google-Smtp-Source: AGHT+IEVRFgO5DVOYljk9RqX7HCzeBu33NbjIYZOISfw7tLB1b9zY9CHaQFilc6mH4jHMCquxhf3Ag==
X-Received: by 2002:a17:902:b110:b0:21f:207:bd88 with SMTP id d9443c01a7336-21f4e6cfeeamr21443935ad.3.1738940691364;
        Fri, 07 Feb 2025 07:04:51 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:04:50 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/5] staging: gpib: remove unused variables
Date: Fri,  7 Feb 2025 12:04:03 -0300
Message-ID: <20250207150427.153982-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove some unused variables found compiling with make W=1.

Gaston Gonzalez (5):
  staging: gpib: cb7210: remove unused variable
  staging: gpib: eastwood: remove unused variable
  staging: gpib: ni_usb: remove unused variable
  staging: gpib: tnt4882: remove unused variable
  staging: gpib: ines: remove unused variable

 drivers/staging/gpib/cb7210/cb7210.c        | 2 --
 drivers/staging/gpib/eastwood/fluke_gpib.c  | 2 --
 drivers/staging/gpib/ines/ines_gpib.c       | 2 --
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c   | 2 --
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
 5 files changed, 10 deletions(-)

-- 
2.47.2

