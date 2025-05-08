Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9772F43
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696068; cv=none; b=aim/4S7/oGSyE/m4VK8+M7i4kpRPj/D+Ikns5jfbZQNRX4RvpDqGZzQ5sAU7i+lydQXsJpI+ueTtZrxX7fbTA7KHaBQH9RYmEEHaY4TATqagY7tcvjctkEWeuMhl3dfPRIE9CHHR7Ny8un40KqmG178BZxJcUYiSsVMY3PONU5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696068; c=relaxed/simple;
	bh=OR62SasjAQdChSGRrGGEq9q3azDTEFgd2S3u3Vq2rLk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FWGgbb0TxvslBbmoeYOF9jTj5TH4WpgJjDzgGUUEjvMWlG+FaXUoN9oFqN2ROVW9nXgMVy4vOCKCCa1lG9bCDbFWfcmWh99oGPOWJTjBXQBI2OHNBYtPlIgGoWnkBJdsSq7DJL0potT60FL+AETiw9HTNl2uLgjstl7QgFS03X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1v9dChi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1v9dChi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEECBC4CEE7;
	Thu,  8 May 2025 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746696068;
	bh=OR62SasjAQdChSGRrGGEq9q3azDTEFgd2S3u3Vq2rLk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=m1v9dChi4TXb2iKccE7sjSfAL9V/oxPlCsJnxmZYEpGw7V/+xPN3+oRgS1wOWU72A
	 OBwvnIvF6zeIbu3xn1xOfAg9Wr9Rs73RiVEbdUjA53Kl6UGbJM3xCAWP5XPHb+Ve/H
	 WD/oaFBh5gZ1fb4IjKOVe+LR6ROJjNPHPIR6ddtLxcYozto7YKdBVm85s2wErIFUUT
	 jqOCz6IlpEeL4qg9gbL3cINdkb21QC91QUUkCOCVYb1iiZPwGywi6rYksBY5EK4/Bv
	 ZNKbeT8cX4VZ4L6Jz6S1NTeB0dGDBmHzNcCTpJH6zT5svSzGxCSc1ld+E0HPLBGpyL
	 x3IwB+99q1xIA==
Message-ID: <79648a2c-127d-4dfc-b75a-eace3d874fcb@kernel.org>
Date: Thu, 8 May 2025 17:21:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v4 1/2] f2fs: add a method for calculating the remaining
 blocks in the current segment in LFS mode.
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250508074756.693-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250508074756.693-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 15:47, yohan.joung wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
