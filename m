Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E92E3394
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474378; cv=none; b=gnMou3ptaKvSymo+dX1vBf5uD4XI8xRgeL5fxM07CJdjRxnmtqx+KAs9T6NIGxgdgYjHYJsNqiihKU8URLAOlZyQ9fe0PhPhMkOeUMt0H3m81lWzHKYnC+PdfEDaRY5C7VdTZn6ioJy5nS8z0HdQ6H3ARx/2O6eF1FYF6CnwoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474378; c=relaxed/simple;
	bh=Qj5lRgKTdGVfDGyxGKzeQq0unXZcpKgG0YcOfqK6vrQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=A9wVEgVWbjzI7iipXK6VKLaPYNUUU5/kv5RdODY0k5hld1m7jT45wNHjB5N4rPpQxbyfZOzPCMqxGVB1+Nxr8DV0cCkmuUdRCn3umsvjrBerh05sKNyDdNilOsF203nfrCKfzdPJUZ8AB+7oHVKvAnVumJPO6x5VNR5Dasg+8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB+HeFwy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB+HeFwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E3C4CEE3;
	Tue,  1 Apr 2025 02:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743474377;
	bh=Qj5lRgKTdGVfDGyxGKzeQq0unXZcpKgG0YcOfqK6vrQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=gB+HeFwyTOh+oKJ9dfNd+W+hC4erRDVvseaTFn0+CSq9PopU2DnSPvV3qViiOyTWT
	 9psSxkMAui3T+dUmk5xR/KjE2a+8WlY1rpB4pg97rIL2lOkhPnIrNwKlWNdOUclmpC
	 PjU4dpYKcz4juTPYP1YlAlL1NShAgMP3o4bf7ol+id3rnr07KCm9rYv0taF01lTfYE
	 0ERaeYxWJD/aBaw4RhBeDM9XK6Cf2kr2PsDWt9pqCUE6tH8IuVT1I05gntx+GMsnec
	 WxYJBVe7fjNXMXGd9MF+ge/yU3QPyYjR/dkZpjJ/N9K5Fu3Xhwg3BGqI8IYb8bhpeG
	 DwasRrKvPidug==
Message-ID: <bef1588f-9c76-44a7-9b33-72ec307ae79d@kernel.org>
Date: Tue, 1 Apr 2025 10:26:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@suse.de>
Subject: Re: [PATCH] f2fs: support to disable linear lookup fallback
To: Daniel Lee <chullee@google.com>
References: <20250331025416.478380-1-chao@kernel.org>
 <CALBjLoDnzALdShsEzii6pK+fxgbeNVh8weKVtb=PyFJ3XgS1NA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CALBjLoDnzALdShsEzii6pK+fxgbeNVh8weKVtb=PyFJ3XgS1NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/1/25 00:31, Daniel Lee wrote:
> On Sun, Mar 30, 2025 at 7:54 PM Chao Yu <chao@kernel.org> wrote:
>>
>> After commit 91b587ba79e1 ("f2fs: Introduce linear search for
>> dentries"), f2fs forced to use linear lookup whenever a hash-based
>> lookup fails on casefolded directory, it may affect performance
>> for scenarios: a) create a new file w/ filename it doesn't exist
>> in directory, b) lookup a file which may be removed.
>>
>> This patch supports to disable linear lookup fallback, so, once there
>> is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
>> ignorable code points") to fix red heart unicode issue, then we can
>> set an encodeing flag to disable the fallback for performance recovery.
>>
>> The way is kept in line w/ ext4, refer to commit 9e28059d5664 ("ext4:
>> introduce linear search for dentries").
>>
>> Cc: Daniel Lee <chullee@google.com>
>> Cc: Gabriel Krisman Bertazi <krisman@suse.de>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/dir.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 5a63ff0df03b..e12445afb95a 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -366,7 +366,8 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>>
>>  out:
>>  #if IS_ENABLED(CONFIG_UNICODE)
>> -       if (IS_CASEFOLDED(dir) && !de && use_hash) {
>> +       if (IS_CASEFOLDED(dir) && !de && use_hash &&
>> +               !sb_no_casefold_compat_fallback(dir->i_sb)) {
> 
> 
> Would it be beneficial to evaluate
> !sb_no_casefold_compat_fallback(dir->i_sb) first for short-circuiting?

Yeah, I guess it will when we disable the fallback by default, will update v2,
thank you!

Thanks,

> 
> 
>>
>>                 use_hash = false;
>>                 goto start_find_entry;
>>         }
>> --
>> 2.49.0
>>

