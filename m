Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836522A7E2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396762; cv=none; b=kvHitY3zaCcC45LlxhzpSMt7DQ1kE/4EBF+HLkO5QtawwkMAh2516o9D2Bd+7pGf7TOpHw6TUBgGeK189TkxNKxbl0H+B1JyH9r75RdekO+4JRU3xEsU6lfPEjNFYh6uP9ZkmM5xXv9jPdWdj+G2sQrRn5DlqcexB3kdH45lSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396762; c=relaxed/simple;
	bh=3yZbjzxDVDYQJwaaKXh5NfwJopR6odWrswC4Uexz3EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTOPJP7Y3tZ6rZVjVKFjO2VJYMcYBtd6dT6DWxwgZk7Ri7Q0sWFLOetzobrNjFm9m7iQGaJOhLjjaa0Nd1NKOE0cdzeQ9EsknJTILVxi8GjbjRDtrKqYBAoBbNG1B/6XLEMLyuK5UHfBA4V9/BJC4ipizrxEu3Bmx+enmVtTAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=T9frOHSD; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="T9frOHSD"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8762a0866a3so164304439f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751396759; x=1752001559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/rCw+Zb9Mvts9DJelBmRopD1r8plgjJIjK44R7yOGU=;
        b=T9frOHSDOBCdAFJt1kmzXMDr/CXARB7S5lSdR+xvIha5y/TYEBrFK723FcvjGejiYe
         iq08Cb1NQfaF0zVkYkJjP/ajgD48CSOd+dVt0z3FO2pkkE37fQ0I35G92skzGjJrhNvY
         2o5qCDF2PqQ9Tq/JfZGiGyf9uPHxSEpqjgIhmFFQPcAMIx+06veheny05JFIWqvaDQOc
         DaMRz1NJlxIS0ctvTjZm8pcfFqqVUBc7vngAZcVgPXojK84eoziDh79SR8gk/ZdNqr94
         xhT6Gl1XfwRg0LYNtOsvJSauZAJkpL81uyTQNwnfcPj8YDlbikgkQw8l0/8NqlIksJl7
         LKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396759; x=1752001559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/rCw+Zb9Mvts9DJelBmRopD1r8plgjJIjK44R7yOGU=;
        b=IMtqwVGy/T4teRtVW8Aw0+FLiA97LA9R6jQ0UWpDnUzmjCViAqn5fU4e06J/tN2MYi
         dKVe3RGKDbbjB3QUxhSsJqR67Oq/3gy231qFkCJ6/slXfjDeplTAHKkA+2xbh4V9RaH3
         3bZTLRZL6cnDHixJ3B6r8t8uaPcuW6mcdlqJU+sCfZUBAws/MLfaEV36ij/GgVcRA8po
         gsb+RYO76Ji82lCrHBmCjlVVzkLuVVK7XB5FFCRwBwfOnH6zH9LvzHcsDj9vwI3GirVu
         YrYv1fYbmLnNXdfVbPShNvYoXkKFIaozZ6+yzFR1C+ubP9rJJUuhP83Az3X9u+nQk7DS
         oEbA==
X-Forwarded-Encrypted: i=1; AJvYcCUFuiUNEPobPm1a8+SxhU+psQCbPWF9ryN3Ak4fL02xsTSbrflpH9zqgvXZQqoPPmJO1+zV/3vGYOcNr38=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcPaAkRBesky2P5v68l5AEC7H5gy6DqEvTVfgKY9SEI8poIcHH
	Ew4sKtPU+SEGnqS06+XQqx2z8ThbNKrN3BN4jvVaRaW6GFlGRl4oMcfiFW3FYPiiGEtGG690DcB
	CyaO2
X-Gm-Gg: ASbGnctG3r4qSzVQ76hxmzWQ+KoTB1WMh/FFssqZgglIaSNEEMKJtqObwair4DVli5J
	bVRT2aU2IgJmeRBEbOcIe+9drGC4KbOfmPk5e9i0HdJeyH5RWpdcXIccyws79zcG3sXeGIt35fF
	pXX2S9OfxdA/LN/Yikaq5mBUhMvlFevndTX7fVwy7YdVCENs3kt0GrGKihR9fqjizXA0qXmRIVV
	bc2janugYobZv0O4L3iTPFzvE4kSR1a7CFG/k13cHoaz1qwpEpY/wHySTFpoX44WxeZyGM25yT+
	avWgSmNcB4PrAtUimneA57BawqK1zeidc6rK5zYWF5C27nCUrRanAW1hAw==
X-Google-Smtp-Source: AGHT+IGRWjQOhmtHj++QwKNWgHf7AHpn02TWL1X53w/dyXCPPx9y3hHFUywI0EXa9hDdgpHBFStmXA==
X-Received: by 2002:a05:6e02:3805:b0:3dc:8423:5440 with SMTP id e9e14a558f8ab-3e05485c170mr2894785ab.0.1751396759152;
        Tue, 01 Jul 2025 12:05:59 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df49fd4f86sm29817955ab.5.2025.07.01.12.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:05:58 -0700 (PDT)
Message-ID: <c83a2cb6-3486-4977-9e1e-abda015a4dad@kernel.dk>
Date: Tue, 1 Jul 2025 13:05:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] btrfs/ioctl: store btrfs_uring_encoded_data in
 io_btrfs_cmd
To: Caleb Sander Mateos <csander@purestorage.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: Mark Harmstone <maharmstone@fb.com>, linux-btrfs@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619192748.3602122-1-csander@purestorage.com>
 <20250619192748.3602122-4-csander@purestorage.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <20250619192748.3602122-4-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> @@ -4811,11 +4813,15 @@ static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue
>  	loff_t pos;
>  	struct kiocb kiocb;
>  	struct extent_state *cached_state = NULL;
>  	u64 start, lockend;
>  	void __user *sqe_addr;
> -	struct btrfs_uring_encoded_data *data = io_uring_cmd_get_async_data(cmd)->op_data;
> +	struct io_btrfs_cmd *bc = io_uring_cmd_to_pdu(cmd, struct io_btrfs_cmd);
> +	struct btrfs_uring_encoded_data *data = NULL;
> +
> +	if (cmd->flags & IORING_URING_CMD_REISSUE)
> +		data = bc->data;

Can this be a btrfs io_btrfs_cmd specific flag? Doesn't seem like it
would need to be io_uring wide.

-- 
Jens Axboe
