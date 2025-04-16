Received: from mail-io1-f101.google.com (mail-io1-f101.google.com [209.85.166.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F018870C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826920; cv=none; b=BYRxCMx5JJC2YwfhQJ9eyCfC422x9C3W5X15UDL7YSUPrecaXMx3ngXl9HJvzE4+6kU3CfRsE28CKImpBUKtDElpNGXRuSlgdu5qw43yvUM1BmJv512cpLYmNdxnysyf/zblaMXenLSCRr07n+X58vpVZR8Unu+Ll3rEJ/jZ3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826920; c=relaxed/simple;
	bh=8OyViLUCHII16I1nEOvw8VBmdRPbm9PLpU/EteHs0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIUUrtAg1O9y+vSHbYcuAQj6XE/LAFIExUWP3Ug81eDUWtkAj+g20bbvXjB1YT4BQ0lOxDRoHj5WKIccMat03FT9Y1uQQJ2NoC2pggeiE2zzcUvkNhuxu5KwGzVHhHDRMmLst7iLpkJzFL95RYVGVtfdIieT/8JMHK7qG7RxeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=M59+Bezv; arc=none smtp.client-ip=209.85.166.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="M59+Bezv"
Received: by mail-io1-f101.google.com with SMTP id ca18e2360f4ac-85b3f92c866so172304439f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744826917; x=1745431717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8OyViLUCHII16I1nEOvw8VBmdRPbm9PLpU/EteHs0ns=;
        b=M59+BezvZC4gDaLIcyIBZM4u8H+AGGT3MejdM6xRyKsRkHDHkn9PFB5h5ajInmOKkP
         dRDN2UF7DwiZvGv9rmflzrsbX/usY6Oi333rCH4meMkdxwVQnrUM3NKBNi1eLLAIl+Dm
         KjYDpMIz7Zot0ZA8T8P/0wmz4dRLKmfFE1K8IFot+4dko4XA9NF0GxXGnmTltNAcpx/T
         yU9ftSqj9PSJexAnUNaXOK2IsXw9e8uLncGb9W6i41GugjOSZcgXI7vqGIIsOxwrsLtC
         Sil3dK8Z517bF8gjUlp2UQLJv5Pg7c0NrLYRqamUPUqbOV4B65BFDCaVOoBNRk+heIYs
         OTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826917; x=1745431717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OyViLUCHII16I1nEOvw8VBmdRPbm9PLpU/EteHs0ns=;
        b=ox6etNMc8Zui5W1L0/6iA5i6Cv1KCcxhcBYZ95B+uAqtnjZldnVUpxAgndwDWWi5oj
         DnW07if326+hYXlwJdIJmNI7LRHQ3fMbdgnfX8RHP4lLv7U7fDpM/5Vu9lD/cJG3wiBK
         M0vLm/ASs5+qR2x0noqOi+UeemJLQfqBFSV9KQkei+D4Udtvg3QaMloEkdC2myfdxL8f
         VMZczfcaKT6+LWOM5VBGsFYks9HfCps6E8uX53BKvyCtJF7blgCajDvDmp2+nv/Zz3hV
         RxvVoxz8yKVJ71a3+iIjMfm3bi4NEN/+nEQ2Ivn3s2e1XcwheRA806YKNLCB4ZRz5NYN
         M0hg==
X-Forwarded-Encrypted: i=1; AJvYcCVZHzZ1xd4poimRcfWJVZYLEWhA7OIckjNEwrbdZy0qRTOINxGKfXvxi5KAt/W6sQZiKNwB+NkZh2Aj16U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVW6hyKaQB45yARdEitma7mC3YqIY7x9mr4pmgKVYYQ+Ol3a+2
	zguMR32gMZVMOXW98S4obxKV+LHfptvwX2DGwWkDhUIxBpx8iNwF1eI97z5ryDISVuJ+1wh2Ao3
	/VIyIGoeMw4Bt9nuS/YibRQbsRH8Caolad4BQckeFZ7o0radA
X-Gm-Gg: ASbGnctso9MxLL1piCNSqKkYic8IXos9RTsKnKfXJn+RAj7YHhsnPk2BQa7WuqCpzru
	d2EuvG7oVWQh3B8y3EU5rGyGhmOxKtQVs3XURzIShi5rjH9kch4ToqenOCthvdJNzREbiHcyxxt
	cB16axQmCgfFxkpCmsdqkRICX4tlHLF1vzfXuAxIMBvclvXEvehitU7RQ47yUlqBjRLBImypRN/
	XuDy5tD9AjB7aFFwq4mu67oAystFO+HFMB0ybl3pRGcXKjO3KLmvg7I7YMfXUY1yanFnOzhQgfo
	q06MXMPb1BI9uTdRi3OWWoG1KZa8WCg=
X-Google-Smtp-Source: AGHT+IHubmPMI3D+iMP9Z4MxiqL5kz//to5CHZZ6BvyWbGkfWWYz2Hn9RKWknQzdAstPB9lXS32dUwQB8QlU
X-Received: by 2002:a05:6e02:4904:b0:3d8:18f8:fae9 with SMTP id e9e14a558f8ab-3d818f8fd17mr16407925ab.6.1744826917459;
        Wed, 16 Apr 2025 11:08:37 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4f505d18f83sm761090173.25.2025.04.16.11.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:08:37 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 41E4C34035E;
	Wed, 16 Apr 2025 12:08:36 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 357AFE40318; Wed, 16 Apr 2025 12:08:36 -0600 (MDT)
Date: Wed, 16 Apr 2025 12:08:36 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: pass ubq, req, and io to ublk_commit_completion()
Message-ID: <Z//yJApTjXvfVnga@dev-ushankar.dev.purestorage.com>
References: <20250416171934.3632673-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416171934.3632673-1-csander@purestorage.com>

On Wed, Apr 16, 2025 at 11:19:33AM -0600, Caleb Sander Mateos wrote:
> __ublk_ch_uring_cmd() already computes struct ublk_queue *ubq,
> struct request *req, and struct ublk_io *io. Pass them to
> ublk_commit_completion() to avoid repeating the lookups.

I think this is rolled into https://lore.kernel.org/linux-block/20250415-ublk_task_per_io-v4-2-54210b91a46f@purestorage.com/

