Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37C1E6DCF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246740; cv=none; b=WVlsO6PEFVwJNQLHZp4xRqQCY4XQCpZHC3190bPCHoVWVKvu58LZS2EFfR03ao+HTn1TY8FcW6ewe/2zm8wabsUWwI6patdTAu7QlmKLcGMYabFUp8aaps8hAExM8BfZ2/GeJJgkA5j9oGN8QIvdTrEYnNfPsC7F7ezPVLfMKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246740; c=relaxed/simple;
	bh=/EdnLnwgqpgYnJOlt9Wonh398iiQ10JCnD5IDSk8dgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QciUXtHeXZ3Fu3VcYOPe7Nn77MaCAzHDLB9EDm6nXYffaxwPIlqGPabpUsub+gVy1nKzt8j4i8q6h1AZ03+k0WDampwUGt9eD3fhB/tUBndTu0Vy6h3lJGCLrdLbh2MiGJ2G1W1Z7wfn2FtbIrsu7WF4uyd87dlhdGfv1HgiE+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gc3s1b62; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gc3s1b62"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso1105934a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738246738; x=1738851538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OwIKPbP90dAareLYcXFAh/Wx2pfCe1g3ZgGplrN6PRo=;
        b=gc3s1b6215jo8uXiMqDHVL9anjrjCFC8JpoyCk4y0qUUfQNpk5eRIKZstqtKa6NfAY
         fFrKX10CFTc0HKAacBwpre9K4eGYOowdjyx4NrXPnfn1ZZYdgguc/uYq7AfSmPcFQQWD
         vSn87fFnia752OEoBsbQiHbzHwDuN8QW7Dj5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246738; x=1738851538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwIKPbP90dAareLYcXFAh/Wx2pfCe1g3ZgGplrN6PRo=;
        b=pCRPZ5VXY0wtWfIOcKGEYVOUvgXs5+LuTkbkJvLU6TZFiZHNgaJ4kWF4g7JDCKQLzu
         rULKKiswjslF41vzb7HQf52L9Zh0VqW9ELqf7WlK8laTZ7kzZWJcwkTLjHtaqfuIrmUB
         RUF9Xx8qAXNQYhlt95ODnl6y8FxbzzyGrLcIDwOtO9MxDG4Y/K/bcfq2YNBMKDaFEQ9a
         WQeZzFQdTO2d73nfbTBku+ZbOkwqUoydozP7iCG28oG5LmurGAp0xfEglZl0yobmJkyw
         2ZpeMy+b05+gFnV//ZDIgY9tXu67FcyCVFdYSaSsSPfpIe0Snxn8b2MZD1UysRKziP2Z
         NddA==
X-Forwarded-Encrypted: i=1; AJvYcCXWA4C8IAbRqG+Rjr3n2EMta7CS4C7q9ToDYSFMIpskXULigF+G6nMAA57q7zNtSDOu5VMblUBq4/RLUAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Om8QN050tNLCktRCDsVxQu490XLfB2ghx5mDaGNUw08kt7+b
	QMJRDc84W3Ewm7hbqI1d5itYSCh1jK49KkD42FIEvTSxIaXLL0Xw+dohzOf1Vg==
X-Gm-Gg: ASbGncv0PZH+7V4JueeYOzz+UjKA26m2Bdgb34olW/kT++MQc2LqMs8CbCNHYZAEXtR
	nhAF8x+RwGVKLCprDOlqCL7t8CH5eCwAGMT8l2ZCTV+/dYfyvrd6uAoFeM1qBGi1vEeRaajICm1
	sHRdmwlMg/CnnegFkQlwJluXLI4DqDOWs5dpzC2BQ9lYjDQSQPIUeiZBoXTQMYLWmdZy/X1h7LE
	BvSv+UJbjrzrQ33/pdpV1HFmaB4G+LRx5tD+NePIlx4SstwgklA1Nf9UoOt4ad4tbpr2pzfara4
	LhK6r4fN6G7Ml9KA4w==
X-Google-Smtp-Source: AGHT+IFHmt1NKsoPDnOd3kJmqp4FgP/LLfp0mRa9d8YxFpHm21eOGLbNWdtcKe1ldYZK4C+cg40zkg==
X-Received: by 2002:a05:6a00:b4b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72fd0c7f7camr11432203b3a.24.1738246738612;
        Thu, 30 Jan 2025 06:18:58 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6426aa7sm1477602b3a.46.2025.01.30.06.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:18:58 -0800 (PST)
Date: Thu, 30 Jan 2025 23:18:53 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 00/11] zram: preemptible writes and occasionally
 preemptible reads
Message-ID: <hghqkqaomtdf3mgj6iiw4ctqf4l5c6plrsnquhmckubivr6emm@7m4qm5tmkwzz>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>

On (25/01/30 20:10), Sergey Senozhatsky wrote:
> This is Part I which only changes zram.  In order to make reads()
> preemptible we also need Part II [1] which changes zsmalloc.

I think it's a good time/chance to combine the two series (this one is
and the zsmalloc one [1]) and send out as one patch set, because there
is a little of dependency between them.

[1] https://lore.kernel.org/linux-mm/20250130044455.2642465-1-senozhatsky@chromium.org
