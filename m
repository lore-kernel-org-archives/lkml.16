Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1F26FD8B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952443; cv=none; b=nhlopm4SD7sV73dtg6Qj1/oGZuTCuU8hbQHtrYwVYhHvIVXp+UUXbjDZWU4nP3TRXO6uZ7pWr1RTlVj3WTz05uJX3bVccLhZlIbdrY+aU/Pvarh8Pj64Ry1OiWU3DBZRcLng8xF5TK3O3wogAZ54MluSpW7s/D6HJmYxUvhn8WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952443; c=relaxed/simple;
	bh=mnHKE1BUo31x7AyUtPinsLwcx+oySEsRQhIFnGP6ry4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNji78b5wjSPk0VLc3nKxNHVUELwyrVcgFyym/7RFr5S3T55EgiXugIH2aPcX9PYpMCKJZW8yiJHwN8VLpOSruDunKYSeVbxhirw6BVBbpd/cmaYTucc/6MI73mYGq1F6D5w06Y6FNSywJy80wLqhwpozsX2FmsBE5AZL32G0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DHtiU/rg; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DHtiU/rg"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3dc75fe4e9bso1328335ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747952439; x=1748557239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5BNM50paBCJ37VNYgPqSl677v0Imj9cFeeb/Yu2EZA=;
        b=DHtiU/rg9UHDrIoAolmV1etUXS4B8DXyupmcqavapjXEAq2NhCUkDKi9oglV3if5rP
         RDkcmJGOnsMc+DwIhjjpMb53eOM/lH2bRdXzV0LYZNm4trYer/5jEYRcdrLkFcFTxfOW
         2n+LHhd1FkquURNgGhMz/G4ojyFdvskrDvVdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952439; x=1748557239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5BNM50paBCJ37VNYgPqSl677v0Imj9cFeeb/Yu2EZA=;
        b=pmzY3SJCQ+rEjN/URNKd1Po1Vo26+Vuh32eveOOX/OwkEVZbaDQWQ5d6Q2LPOifU5h
         88nPff4sgC/Zjchvcl37M9IGfDl71gqLFd811d6JeTCEHBC9sshG7MCdP/rY4EFXXEiI
         6rs3gHnAgIgSpLpfz6jUubE2Ljqe/JlLtNIF2i4v2ql3llGEq2dGL1AL8Z+POSmvOupY
         Bi2Vq0YCf8850oFQDtZzRVH5FnZZiIUqlrnfHmUqwXO9Qhz2OIDozx1WxFDbznhVGSf4
         Ox/VdtfCmj9ygqTKwUt963gTEC1EshTXZeMqJ5i1t2aez8NtI59ERA3B1xSk4K+GRqYC
         xcVw==
X-Forwarded-Encrypted: i=1; AJvYcCVCrgJui1mIzi5c/bHEi74y5ODSgWeofuD9jtJp91tSM3FhQxWuep9Qqcnm0jRVreGYjp4rCJTYMiCLI6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTZ2D5cA0h5aCh0C2Sy9jgblc5nE068Ip4ZdYvZ/++sxGNvbZD
	zmO7VZT2sT4kmHXM1oh/JVczbV69zHQydOxMWRsz97ZlFkY3ELrjzqn0sYoQ11iaKco=
X-Gm-Gg: ASbGncuEqOcFNUZy72z7jqeBoyDwrT0GikoMnr32rH+WAHIvyrDc7O+3hXfemdvY6Za
	rFaTyAXKlzMVUpOT32feCXHRLDnHo2XQpidcyUDFf5liIDM4abvMIzCzO2LVWI5LoOH0mIHe6n4
	IRRftS64JxeaCEu2BBkxWiGTfM85EuyqOHPw/vbtO6LmwN+z7Gn6WMAvjC9itr+LvJI6fpDzf15
	ItC6g1m9qqc62+U/tcc+1SRs69T+PSSlRdcgYEqbAw7nipkApCkvcBH9I0L2Wab/u4q/R2H8fpd
	5VssllK1XqIUyiShw50TAb6Ua5Fv6wpOB1SPwfv7WJzoT7PnzxdCQ2vgDFktFfIMolETO3np
X-Google-Smtp-Source: AGHT+IGYLQ2LO5QOfE62VgsMxmlKAhEOBopbDS6A7t9QHHagvVdXFcgpgAg/8sKLAv9dg/KeRHZBUw==
X-Received: by 2002:a05:6e02:16ce:b0:3dc:8e8b:42af with SMTP id e9e14a558f8ab-3dc92bf6514mr15590275ab.7.1747952439346;
        Thu, 22 May 2025 15:20:39 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc85440323sm10378805ab.50.2025.05.22.15.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:20:38 -0700 (PDT)
Message-ID: <2973cc3d-a4e2-4120-ae89-730581090ef8@linuxfoundation.org>
Date: Thu, 22 May 2025 16:20:38 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: filesystems: removed repeated word
To: Nidhish Chauhan <solemnsquire@gmail.com>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250516164648.15396-1-solemnsquire@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250516164648.15396-1-solemnsquire@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 10:46, Nidhish Chauhan wrote:
> Removed a repeated word 'at' from journalling.rst at line no. 96 in
> filesystems directory.
> 
> Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
> ---
>   Documentation/filesystems/journalling.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
> index 863e93e623f7..2825f6c030c2 100644
> --- a/Documentation/filesystems/journalling.rst
> +++ b/Documentation/filesystems/journalling.rst
> @@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
>   
>   Try to reserve the right number of blocks the first time. ;-). This will
>   be the maximum number of blocks you are going to touch in this
> -transaction. I advise having a look at at least ext4_jbd.h to see the
> +transaction. I advise having a look at least ext4_jbd.h to see the
>   basis on which ext4 uses to make these decisions.
>   
>   Another wriggle to watch out for is your on-disk block allocation

Please run get_maintainers.pl to get the correct list of recipients for
this patch.

thanks,
-- Shuah
