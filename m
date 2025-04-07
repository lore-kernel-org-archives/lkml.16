Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8852139DC;
	Mon,  7 Apr 2025 20:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056190; cv=none; b=QZPXI41MdTVvq7Ssb/FHohxF2psBzkwMtvjfPlaW+l5VxVq+fxASigHn4FaCqIEeju9A3hjg8kE33zYAdJCgE11uxKRkB3qpbkvJIff4EzDYQi9zvUXA3xpGTxO9WY5MI90SWIe6zLXP+5Ra5p8zZX8xQrS8tqQw9EXzUSt15NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056190; c=relaxed/simple;
	bh=ducg16hfR8hZueXDsQDQPB98oESAhaelf79Gxs3b3Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cz2Zp4B3/fWDnwOOGEcNa89Bxbnf8coZKS5DDAFfiG4QibL5T08yMeUdBtq7AQq6tBSmtz8Tybm10zPn5a9b20YkFH23joAfOP5BZfhEWoMQiF8rg/OT/PYuAznEDiT6+BDZEn6aj4yi1l9HLdg87BF0VDwvjd4IpafTH4MYHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO/s3FtH; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO/s3FtH"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2c77a5747e0so2618995fac.2;
        Mon, 07 Apr 2025 13:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744056188; x=1744660988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/HVQqx7ACy8Wke2eXLxg0sKouM8xAKI7gwGAUQ/F7s=;
        b=jO/s3FtH2f1zbvV4T0yDgQ/hRkuUDxJfwe73UVW7FdoBsqieA9niYnO8+MqnrvDqHI
         Ct5ObN0w9eB0cvZt/FM33WChSp0T8H9Yx8qzkjZGLa99b0t5sUqg7uwR81h7HNmiPSDJ
         f1N03aBhbKs5T5VjiSHBoXQPDPw0XGxtU8oOPyS+YZkCZD8sWH8v6nLbNoJ04NU/Y7Ue
         ogVKrLH7G8DhHYMy4cxzwk5PvN9pViUQtdEaFkmShUtlOsKBDTLeMUHzl4PdwJC+eDcr
         3irFfb1xr/os8ylLd5gmQeZ2uQmHLeZGBGPOjENOxUoMeuZZr9JuAIZ3mx3x8GcKUQ14
         Qo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056188; x=1744660988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/HVQqx7ACy8Wke2eXLxg0sKouM8xAKI7gwGAUQ/F7s=;
        b=FYoC6DdfAenrllJhtMtfI+IUQgM6IkXmEsHs+YiaRCMMTinW7SE7xBPVGSL0KX6Hwf
         OASrAtAuIvgy09SPEZBrWOAmIME5qCs77rfC3drUS6WJPkkk8aWjEzVZ2uyNipoOI5Le
         fuhkyCfUt2yVuShDXqLeIrw/fZ0G0EhKSJlKAGAbenifmcv2pGMkA7lcU7gFwOd9b9qV
         f7c1OvajCu7fOrs/65bqwp5w82qyjU9IZq9dLCAs46U33kA+g/ljq5jNhVF3vpVBCXhR
         mxBu6lsL/LK5kU/Y6ebvjarhAL0ApX6M0AvXi/WEr1fFXrL5uqnzI/0ZinzZfb5KhOi+
         JicQ==
X-Forwarded-Encrypted: i=1; AJvYcCUre+iSZZfAd26M1qO1Lty+InJ/hFByenGQQO0vZI20Xm6NmIHgotcPANxDOrjkcW+ii7fRubLBbUfX0rM=@vger.kernel.org, AJvYcCWLoxdPM0LaOuEIHFIhdHJ2e8vytuYKng0PSPfS6JiP+tauc4BOTgcQpzfNRsuvXmbz2WAiPGjRSxBMahMq6tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaFHowruG9OjmEG1nBRtUwBOUXGOMUAqWA0RBgryElxL+xhtKI
	KfnhqhJPdDVpeJO8Gt6pkftmGbE3Zjk8IweCg9/UxXlnFuZuOjxu
X-Gm-Gg: ASbGncuDIT4OPf3+7klmluN22jXseXZE//9xB/Tl2t7soqPOcsi/wx7ylbQhrfj/WzU
	jGhtzKTmnji9npJJoq1A6hd13YdNYaNXnL4u6c6lFxmDknEvUyijL3N/uwXi5VfqJ7HOLJqTema
	QZZMlH9mT2+SbLelobp8J08hnAVJKDUxpJVFf8dB731Ivg1Usg6rG3L6CDu+O3SgxJQ4rrlfBqO
	+viVeODke1buKibKivvOG0yj0KlsYKKmj9mZBBjA8ygzct2si+2rUhc7C266swKFlxcVO9cjoP0
	T2iJh3ueC9UiduDC4C2CGdJDgMtY5algpmLIyVzp2kLExsL1F+acACf9KzQvqWmrXhZw6wUaw+t
	XIXSbIYVxEzYspqbn
X-Google-Smtp-Source: AGHT+IEEJurb5ksp2fl+uD+idand6jtxtZrvPetDZX8MmlzKvRN2A/ZVHQqQepzpL/TrEfq200nwbg==
X-Received: by 2002:a05:6870:e38e:b0:29d:c832:7ef6 with SMTP id 586e51a60fabf-2cd331bc71cmr5607523fac.39.1744056186749;
        Mon, 07 Apr 2025 13:03:06 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-72e651a0ee7sm73360a34.38.2025.04.07.13.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:03:06 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: liam.howlett@oracle.com
Cc: a.hindborg@kernel.org,
	akpm@linux-foundation.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	andrewjballance@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	dakr@kernel.org,
	dingxiangfei2009@gmail.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [RFC PATCH 2/2] rust: add maple tree abstractions
Date: Mon,  7 Apr 2025 15:02:50 -0500
Message-ID: <20250407200250.1671534-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cons6o6begjlf4eu3wvhplimbrjtns553nugtblki7u23a3u3p@efca7vmgmr6w>
References: <cons6o6begjlf4eu3wvhplimbrjtns553nugtblki7u23a3u3p@efca7vmgmr6w>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 07, 2025 at 09:59:21AM -0400, Liam R. Howlett wrote:
> * Andrew Ballance <andrewjballance@gmail.com> [250405 02:03]:
> > maple trees are sparse array like data structure that maps
> > non-overlapping ranges to pointers.
> 
> Why do you think the maple tree is a spare array like data structure?
> 

I called the maple tree "sparse array like" because indexes that have
no entry map to null and there can be gaps between ranges. I did not
mean to imply that a maple tree was literally a sparse array. 

Would you like me to reword this?
