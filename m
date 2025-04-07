Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0310155A59
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743993739; cv=none; b=AdRyCNNd3T1R1lHZBDNkB6/R4O5fkGRi7sN0grvWWduFb3cmsugwy16yMbhtlVFdRn7QoAtOCFNDW56wHQ7bwdm38nE67IARgxq2a5YHw70r6XCsNPtUxbKfymzAw9YQdITn8un8bB0niS4SqYuCHA2DbKw567CitKo9JeVTw4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743993739; c=relaxed/simple;
	bh=gDlzVIGYtm+Se/bs835g8E4Dd9CfYgWb9Ta3picnPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5kNNXKYH+6PoEZ7Sl9NlkjdR4C8UXajV1GwZSYk1E6hyLmbuVF4+WzSe2jbJel8ZiCNZXXsT/IDq5FdFV6ucar593SdjrUl1YNzYYXv9iD1srA/h1Q6zF9l9oZeorr7hYqbMVhTLKOLKEVzY2l7MtevvXVK4HM24pADQcRLrA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwF82CMQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwF82CMQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so628952166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743993736; x=1744598536; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlzVIGYtm+Se/bs835g8E4Dd9CfYgWb9Ta3picnPfg=;
        b=IwF82CMQZlVWnPbJEdfCFLP2kwkzzYmmjZEJaWBuhz88LlmtPq4GUhvF9888iVOwHd
         dHkga50YkGdDzn0VfIMpHZsv3vMD2s1Aup/joHKeQqLCr36dfwBRMJgQrwAsOARSyEZY
         n6z3BqIg41rBu/FSjYLLhRkjfl0STCc+1ur/rDWNTXtBgZQe/NXIQookxeEZxOKj7v1K
         +IYZtASQq6zw8dCzGutadwx1+ZqDPJXQSVx4cfIYPwZhf2Pk/nqZvhYjWr2nKxbC0bka
         rDqzGoflh7kDZ1L8KyHSuGLr0tUC5ZwaloSdohhKm5mFX6tQYFCR0SHiY9mQx0nC3TX1
         P9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743993736; x=1744598536;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDlzVIGYtm+Se/bs835g8E4Dd9CfYgWb9Ta3picnPfg=;
        b=a+w+6g2Uz/0jTJZGw0KmAnRtNw6GSMt6/XvjxTEPQPl/1hBPAqsKlq1D4HImIjjABh
         KVMsYmUyvoYuvPvaIjxv9uEiw9/n+QAoJc8uctpsabBPUJ7wieK1Fq6pDBBhajNO2YfV
         WZlKKV3+I8TJ2Vn3lrquDF+m41fM4k+I0f77zCK4Lt9smDxJ5uA/RmBLq1rjcp+0zgjW
         TUWlT++NF4SD8oWL/dsEooJMULjsiq3JDRvTF7xN3g7nSnHLaPyDl4HHDha0S6Un07fs
         n+WBb/468CVAqCcoAZZBd0pj+mhbnxmm1ajc49pP6YooERQDrtflWz3gqK6Lf+sk/TwJ
         3+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwzMj0alPccGszQYjdOF4+Lv9f8tcrNI0fwuCT7i51MgYii09BIcUc/Ja69mxMlzEiYIHuGFNkbaNfgJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCuuHWw79JvU/s7VI7XWucrzuDnJy1reHijK+NYodvR0CoPbU5
	GOQIFE81+LftHCTF6p5Jted0S8gwOYcC3QcXWnW8q8ezIvOdNJcO
X-Gm-Gg: ASbGncvaGMG1HbF77p8wQr0rqs4xtGdjA1lHyskZu03zJ9A2CHa8fQo21LxFkSax3U8
	yBWcawtEWDW3irbISrDvlT/iZ0b1n9YeYjq2XjLCdfsZjBwCkkPkBRTVf5le+7ZzDQVe1agYL2B
	QUoSwyfvf9KzBboamFt/5oV4g8Hi55JtTAs4VNadAJSXghlpFnZyWeRMRLGsun9NrCf1Lred4/J
	trPMMhnEPhfz5e81EuW/5RuLar86EwhRkpWn+5XPf6RMVCEWLkF0QluvKXvNNBz7cAQGID9FjxT
	ILU8ETozVOmso6vCzC8+e5kKfYMM74HPYy/x8y8R8zAuKpSDs5LDR6o=
X-Google-Smtp-Source: AGHT+IF78Emhh04kwDG8vk4HmMAYxAhki3SCwVQPpJplE9JAU6VrrfT8rkPxV7l9DPJBE86cPYUCiQ==
X-Received: by 2002:a17:907:2cc2:b0:ac7:1600:ea81 with SMTP id a640c23a62f3a-ac7d19ece28mr926746166b.49.1743993736016;
        Sun, 06 Apr 2025 19:42:16 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f646sm656784266b.120.2025.04.06.19.42.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Apr 2025 19:42:15 -0700 (PDT)
Date: Mon, 7 Apr 2025 02:42:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] tools/testing: add PROCMAP_QUERY helper functions in
 mm self tests
Message-ID: <20250407024215.pgxvxaikate765yi@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <fafaa05d2f0fc7ff3c2b852427dc9b64e1709891.1742245056.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fafaa05d2f0fc7ff3c2b852427dc9b64e1709891.1742245056.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 17, 2025 at 09:15:04PM +0000, Lorenzo Stoakes wrote:
>The PROCMAP_QUERY ioctl() is very useful - it allows for binary access to
>/proc/$pid/[s]maps data and thus convenient lookup of data contained there.
>
>This patch exposes this for convenient use by mm self tests so the state of
>VMAs can easily be queried.
>
>Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
