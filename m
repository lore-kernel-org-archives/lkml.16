Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435C4C6C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104326; cv=none; b=JV7p/EAMMBW63DsNOh+0B+eRnMIUDo5TxeZ9nw/Q/Tyy3eqXFRpbl1PH3js28jZZj1MxlBHI0S8PmgfyneUfCW2/UVwTtB+zEmzNL7ielzHYoJpRCUOJf54HFQyqhAy68IgDcic4gKRgw1ut+hSlCg8zIhNp0kbBs7ybE9fMWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104326; c=relaxed/simple;
	bh=NkWPYggq97UhPZ6nY6Tgfs6p7CE1uNPUe8N4Da5ZLZU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NLRhiOmKC2tN89HVua1+qG2U57GYtya7DDMqTy+nHzWV20vP0B43MHjDJtev0gXdyi90kSb7Mb+kDhzYFdnQLiG2c/ZpRln46ReNDHke9KK9U+11HvuWA4LkrqMB5ZKrP3EPhh3Ks3YKkMW9uZ/as2OhxG1oSGssWFpiFxZFlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xbvuhv5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xbvuhv5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A809C4CEE7;
	Tue, 13 May 2025 02:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747104325;
	bh=NkWPYggq97UhPZ6nY6Tgfs6p7CE1uNPUe8N4Da5ZLZU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Xbvuhv5vB05UBWs2cAexjXEu0pS7knoeV4jGHE4PjVmWg/8CHrz35C1ZdPUOMZXRl
	 CZXXxdtsNpl1MvEucq0JdAQSLJECsp3AryQEtRxOOugXRIB4g/5o5/7EDv0plHrw9F
	 Af8/2d1LjyGbecnWhOKjoD8JWi2ZqOHdVFuNt0KKdOyPW+62SEHRDtAjGgtnvONs/k
	 Esg+uGbph6LwO0dKCj+1zJlWVUtRkPauvvDytHOplcbAIKvWgI6ia+pxbQt+FUoAEl
	 7AJZVUH+87ffXM843NxkY0jj6n0Fv1oafIEAXuOAHwjxFk34ZhJqisU8R+SpTpifss
	 GH5uP++Tzwd6A==
Message-ID: <44e7161a-0da8-442b-9849-7fe7e51c83f3@kernel.org>
Date: Tue, 13 May 2025 10:45:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250512115442.2640895-1-chao@kernel.org>
 <20250512115442.2640895-2-chao@kernel.org> <aCITTEkOYqZdYTy1@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <aCITTEkOYqZdYTy1@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 23:27, Jaegeuk Kim wrote:
> On 05/12, Chao Yu wrote:
>> mapping_read_folio_gfp() will return a folio, it should always be
>> uptodate, let's check folio uptodate status to detect any potenial
>> bug.
> 
> If it's supposed to be uptodate, can you add f2fs_bug_on() only?

Sure.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/super.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 0ee783224953..ea207a9edc10 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2973,6 +2973,17 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>>  			goto repeat;
>>  		}
>>  
>> +		/*
>> +		 * should never happen, just leave f2fs_bug_on() here to catch
>> +		 * any potential bug.
>> +		 */
>> +		if (unlikely(!folio_test_uptodate(folio))) {
>> +			f2fs_folio_put(folio, true);
>> +			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
>> +			f2fs_bug_on(F2FS_SB(sb), 1);
>> +			return -EIO;
>> +		}
>> +
>>  		memcpy_from_folio(data, folio, offset, tocopy);
>>  		f2fs_folio_put(folio, true);
>>  
>> -- 
>> 2.49.0

