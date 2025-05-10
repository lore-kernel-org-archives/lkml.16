Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D627B67F;
	Sat, 10 May 2025 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746874076; cv=none; b=E7LzrOmJ4pJh05mwhDD0bU5NSbSytWLjKPkSetqrCBxUfcoGjfRGf6uS8OXHlRtYWDvaiB1pHxUQRmvd2p5gG9Ik1d2NfCRwl55/IA5FM6PWd7L5IoSKdz5MgEuOccvIDqWjU8c6AkIgUNQQhXYcqDUaLjTBWGEMm5ljqgtUk5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746874076; c=relaxed/simple;
	bh=guKgikhGJmIEydKvKvWq1qzyZ10YGC1G6ISdpGSLVSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ld0t0MCZdFWDeHr8v20s8LZMzQ8qUxb7CPljl24EWLRL4CLsDvGw34fwEamGCZztpV2p09HRUKHYEh3w99dmJsGCbYIz9kZAyuF8FoufK62zccdGmMq0SKN4cX85Owz4lWgz8BbHEa2E0nyew7EoVXXxjPytgx7YLqgR8ghBx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qc8Q/Txn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qc8Q/Txn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70F9C4CEE2;
	Sat, 10 May 2025 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746874075;
	bh=guKgikhGJmIEydKvKvWq1qzyZ10YGC1G6ISdpGSLVSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qc8Q/TxnLqKmINezyP6ENygxELgSfT494xra/Qp2m0WVN8MgDY8PwqTLVdHCyxjio
	 6/js3vBzv1KUgtl58rSt57XE6uyDahAvh4FNVuPwq+TBYmIjZ9fAy2c/uQJp8YmP6u
	 JXKMexJfJQ+aWwzLKgQ6mYPluRzyVWTso9pF+gtgyYutG+rZz9qRHk8kX4cGLAKDdA
	 WOxJL03KMxI/ldDOch972BSh+Essu+R6uyYdeJsLutXquPY0VI2GpwUIuN7+MqnPRt
	 wOZ9WU/0EWAxKSbb10oMP8s9pFmxVmjDYNj9Zc0VXzeW/hj3ZWpoKKm48CGIclnMMJ
	 t2Q/182CzXEMg==
Date: Sat, 10 May 2025 12:47:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] CodingStyle: mention "typedef struct S {} S;" if
 typedef is used
Message-ID: <20250510124711.6b5d8b9a@foz.lan>
In-Reply-To: <20250509203430.3448-4-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-4-adobriyan@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <20250510104751.axOpzaKTXJImNaLcUIX9ZHTjSfJbz-BUVlUFySyeMnk@z>

Em Fri,  9 May 2025 23:34:25 +0300
Alexey Dobriyan <adobriyan@gmail.com> escreveu:

> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index ac9c1dbe00b7..5c5902a0f897 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -443,6 +443,20 @@ EVER use a typedef unless you can clearly match one of those rules.
>  In general, a pointer, or a struct that has elements that can reasonably
>  be directly accessed should **never** be a typedef.
>  
> +If you must use ``typedef`` consider using identical names for both the type
> +and its alias so that the type can be forward declared if necessary:

Better not, as symbols with duplicated names will generate a Sphinx
warning(*), depending on how they're documented and used.

(*) It shouldn't, but there is a pending issue on Sphinx since version 3.1
    still not addressed:

	https://github.com/sphinx-doc/sphinx/pull/8313

Regards,

Thanks,
Mauro
