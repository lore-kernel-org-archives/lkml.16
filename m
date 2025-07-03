Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CEF2E4261
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542523; cv=none; b=Ei9EULssQh3hN5phiLWz7GLZa+Dcdf5CBsQvyOnX/ahJPQQK8q7kMHOjurATU7ILF+ebzpW+5g4e5VQHNmcwujqC+6LTfz+xVq6B/49V69ZkVAUupfeDNV0pBtUxb9WDDUW1sWqaFK5p3okfC/+dSStynvgKmlN9gE76+AUBI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542523; c=relaxed/simple;
	bh=49LA24cLdBXtfBo2L/H078CwoY9pwKgiR1lZ6ffAE8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBdfxQ0xmblB9WHjymt8oBpbaytdrGy0YfV1dKpyT8qUcbKfLhpcvT3gDmKdH6ZDvpuAQVr0HSECmOVsymE28cft67rX+QIEW5iJd3xyVCQV1DZmL44AYHXsYlL7l4iKJjJpKu4/M6xE0IedL2LgZZ5VpK0iPiQ6IdKW1bt7bYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Vp/ex/Fc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Vp/ex/Fc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235f9e87f78so57417255ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751542522; x=1752147322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIC4vniCF6Jqd7vCiFRupPwWt+zfgF+lY4LJeYjZ13c=;
        b=Vp/ex/FceUlpkTv2zGSo1C/R119wc2WGt5NcZ8K0AcE5w0x75eSzzraltS5NKp1d6T
         TXaNS6bsuCMj5wQHTYQdjKRbJ7I4CZFhu4ltEMmEH4RLRdwsblO89PwHDFqe6hOx4TPT
         tkrydgbxQ4i1XUBioAxPUQ0u5/VSklhf+Ok6FmFJ9cZGyQTlPOnfMuNFXSb+CU5Y/JrV
         jogtqivkN7GaLdP7+aBhSSTQAf+q7xbmqYTGXFipdgbfc6FM54rb5/UyEx49Jt3JUd75
         0+4lRWnLA6z2liwZVAvdhvN+583iBiYY1z50OgI1Zq3mzE9l8BocLcPfDXok8mQcsj7J
         oQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542522; x=1752147322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIC4vniCF6Jqd7vCiFRupPwWt+zfgF+lY4LJeYjZ13c=;
        b=X71O9Hkdta5du9l41OPW/fm8YeXAznzxwlB/rKxQ/jGd/uO/cnJKtzj54H5/RxH/jP
         kQBDSkG0iKq3NsxqO+WuUWqZ6rhgtiBpohJWk0+/MAiriSxP9Zw+vGUTcv0q3SIdttLw
         mkmw0zY5JTJ71LiQ2sUL1kqX5IStXP878owRmN71tWErFaTvAcw4snduYmaBE4YZAuBD
         twuHsOOyWIZW9bpal6Zrq7RgXiaKvFqcgcM9Q6TDCvL/SyQlhWyW1uG3wKxaJo6H7nWx
         hGCwyYslbSfG8noD2ibASdE8DrtrjJDQ6O2YJLTq8rWPbLV/jGG+T7XE6JfMmCm3u7AX
         DcNg==
X-Forwarded-Encrypted: i=1; AJvYcCWqQ17v52ccAIfrrMcART/Iets6A1ahMb0lXWYV23cr6roWyy81RWz/DuhFEC7SAbqoxl0E45NSrlDa9sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMOCq1K6V8nhGqp7zJbY1X7tcsXoZ+4tCfb4GchFjoSNCPz6L
	sKI2KZWHvzpGvFu/en8Ym7OQ5Um232lMPyKduHZNY1FBS8VqTX5asIWW/ruwf8LAuOc=
X-Gm-Gg: ASbGnctpjymC7PmfXkSB2T2CjR0FnNLzxg5QNZros+qbXeOh794RJHdGC8bqQXUkgfq
	6ILU09eVkBbR4Nag9OFsG72aljo9rXbGXnkbhLHhjp0VB7CgiU0nqjY2PvUUKiUQvAvQSzmBOmm
	4E57/pHFs1V4a+sUaDlDdBCNI4+yagpR8S+7/O540vS0HjhozldOd10BeWa2ZtrGZCXxYqw4xYu
	lI1OFad7Ijlu1G8dv57U0ELVKxW25kVV0u1gTbJ8qKcp/FgvRbDHTUG1vy8aHqGS2hymnxOWPDQ
	wuUpF9+4wLcB5wUIkFXMvsimIlLHHsnc+Wy5fYs43WJT5EPJfCBELXjIDscqSwn5W71cHZ2wHJG
	tywWXpHszYo43K3PzA6fLCFw=
X-Google-Smtp-Source: AGHT+IH36VF/CIGqz+2J2aqsF/vYGGyR1x2CSKcSaVSwMlw7fNYhqdolTNSbc3ljFBefYDzlONxU4g==
X-Received: by 2002:a17:903:1b2f:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-23c79624058mr36281695ad.8.1751542521730;
        Thu, 03 Jul 2025 04:35:21 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cd0ba3dsm2094455a91.36.2025.07.03.04.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 04:35:21 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Thu,  3 Jul 2025 19:35:15 +0800
Message-ID: <20250703113515.66745-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250703111216.GG904431@ziepe.ca>
References: <20250703111216.GG904431@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 3 Jul 2025 08:12:16 -0300, jgg@ziepe.ca wrote:

> On Thu, Jul 03, 2025 at 01:06:26PM +0200, David Hildenbrand wrote:
> > > +{
> > > +	struct page *first_page = pages[0];
> > > +	unsigned long i;
> > > +
> > > +	for (i = 1; i < size; i++)
> > > +		if (pages[i] != nth_page(first_page, i))
> > > +			break;
> > > +	return i;
> > > +}
> > 
> > LGTM.
> > 
> > I wonder if we can find a better function name, especially when moving this
> > to some header where it can be reused.
> 
> It should be a common function:
> 
>   unsigned long num_pages_contiguous(struct page *list, size_t nelms);

I fully agree with you.

Thanks,
Zhe
