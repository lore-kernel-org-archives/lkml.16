Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE89246BCF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704747; cv=none; b=d2YFcjyajs/ifCFnSQRRbxNbCEclBtjxnXG2JLS82c3M1kHxB9Y8Mb6UILPsvyIsOtgukyM5UVol9l9TYOER7XyMSkh1qmf7zE91Qyddn9Ugy9pKDL6MKiFWTQC0FMQMlJp9Nrjva6kLQ/m4kPzBpta0CnlQ3y1nIL6sKQtK4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704747; c=relaxed/simple;
	bh=gv1G9Z96EFrbQZ1cbL33lVjm9HQLDsqF7DO+CEeipwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmigyjyMmdIYgDICFlg2epNljoLSb2eeEb3vTQ5hhtPj4nvthKwX5gu1ogdv9Ul5UWo6qRWJYkBVkftO5lGnnv7kpgWi2cyj14tYqXNbdYWbJjL7g9boUFhYdxewStm0mre/KdSgsKAb4IupLxMjvDWD7cJryP8OYVjIzOhU+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IPGSpriB; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IPGSpriB"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-70e5d953c0bso49037817b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750704744; x=1751309544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSdtfcO6yct73s8jNNwzmEbNNWfSJFlnXgpHHlfXObs=;
        b=IPGSpriB6GCWEeVCrU+cwSjFwPgBoPb9vO/iCH2hVghOb7ChU0aEtjjCppYr00MngO
         bxHBcg1tf2wzShARuh7r1nZLRYi29pdrHgKq2vvIGcPmejywWw8rScADIlPByuVHU51S
         qDMAUsvZBpBszK1WLcm2eVZIsIHTXqHbE1c4pMRSApZjK5xlC3hnOP7AoPkcKPwT8GiD
         K+hYQwDhc0l6yo+n7no77tOkh3k6okWU1AiPQHH4jQ+JEaJ4s5C4/cSpuuag1pvshnP4
         JVHe1/se8G6qOrRNNpjiJhq3t9i4SI27LGCR/z3yhDejpgJ0hB1Q9MfXK5hgm7kxwZMh
         NErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704744; x=1751309544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSdtfcO6yct73s8jNNwzmEbNNWfSJFlnXgpHHlfXObs=;
        b=LtiKiprgv2Zkd7m0LoVmMGwsZrVa2JDWlSHckhpLPlNe0TEN2NFc7kZ+0cYUKDxNEs
         gbTFNhBr1xHacejnSGLHsec6nZ3yVjQtyK/YxoE38ZiOJPJBoZ8pJB5Ke970WVoSEBfl
         XLvEG+IdEJZj8oKIDG/HY5wx0/xRIUwYRdtTxZepVnMj30+cqGYU4gSPd3UULuZRLkKt
         fu80fQrc4MFNefq2Iq9CafyVwXu28zucKFdPcc/NsP0s3yLwKPQR82OvwLv22AUgEtP4
         PqNRqWXIoxQ0Nx2maKa+zITdiF2KUA7ZrunwGaq/3wjF5JKRpqB1vkXfH0UY9F6S465Y
         7Huw==
X-Forwarded-Encrypted: i=1; AJvYcCU+qLRxztPOc5+I8FO3JWRn/rcNRwidwam3sD9+zSTE2x0JzhpbFUKc98O0QTUA+MeyYFXgt3gssjHHnrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRznVeHvD2IpohAcGdDBjTbmwJMfMjqimliRdSv7BRA2Xb+LAQ
	znEUUUig6nWUo8CjN/7fmdIfe9OQC/nRyZsXXGnxfUseW0BGPf4D5G5y334Q5k5wgmfcZKUiaXj
	ODhqkc/qMAjD0mNTdelnwwABdzhnJVQcntnBGIfcdAfDvm2ASU/97
X-Gm-Gg: ASbGncsdBOtoPw1jfk78Q+3gAeiRS9ks5mUWwv5H3ERtXOe87LoHhZkHOep+/WE25rI
	BxlgvioYHk8N67v/F9qZDhECqycBFtEPV3TtFHRUfbVKHnwqFbBqNN1u5DkpzLd43gEpdTgrB5m
	plC4HeXgHphQB92sgXCicrguNqGr/gn4Vpk77VGFsJMD88u/XBrJDymHqTMtZGNfBWKZNC3d2A1
	gldJw8uLrMsmEwdQ2YRYgCzFi/+FqI+yC1mhcpEl8kHsnlVc/8qLeCy+aQ9QX/tTWK7sVnMp7qb
	rpsuBL+++/wc8ybwQqklwhW0PtbU6pjUIzsFXjs0Iw==
X-Google-Smtp-Source: AGHT+IGDE6E8898w1M/iljDhBprZ95zKNBS1+iC+DsKwuQBLxDeFFN8qYAWUvZfADpnnp5LjhZ+kFacbcEyY
X-Received: by 2002:a05:690c:6086:b0:711:6419:5ce1 with SMTP id 00721157ae682-712c67610bdmr211314147b3.31.1750704743909;
        Mon, 23 Jun 2025 11:52:23 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-712c4a38e96sm1589957b3.22.2025.06.23.11.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:52:23 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D817A34014A;
	Mon, 23 Jun 2025 12:52:22 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id C93D1E40278; Mon, 23 Jun 2025 12:52:22 -0600 (MDT)
Date: Mon, 23 Jun 2025 12:52:22 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: fix narrowing warnings in UAPI header
Message-ID: <aFmiZpTDrJ5GSGty@dev-ushankar.dev.purestorage.com>
References: <20250621162842.337452-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621162842.337452-1-csander@purestorage.com>

On Sat, Jun 21, 2025 at 10:28:41AM -0600, Caleb Sander Mateos wrote:
> When a C++ file compiled with -Wc++11-narrowing includes the UAPI header
> linux/ublk_cmd.h, ublk_sqe_addr_to_auto_buf_reg()'s assignments of u64
> values to u8, u16, and u32 fields result in compiler warnings. Add
> explicit casts to the intended types to avoid these warnings. Drop the
> unnecessary bitmasks.
> 
> Reported-by: Uday Shankar <ushankar@purestorage.com>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> Fixes: 99c1e4eb6a3f ("ublk: register buffer to local io_uring with provided buf index via UBLK_F_AUTO_BUF_REG")

Looks good: https://godbolt.org/z/qovrerdhd

Reviewed-by: Uday Shankar <ushankar@purestorage.com>

