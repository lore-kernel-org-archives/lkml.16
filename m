Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B0214815;
	Wed, 23 Apr 2025 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410454; cv=none; b=mNGN02P8nutNTtjFscKr9Ej5IQpTa/+iBzl1N9rbPTyV03Dxm/nYW/k2OmTj+UctKqAGmZ8NZjwvrP4A+ywJIqFiRkuW5Ifm7p3DMHm3ag5e/MPU/0RWpIBiR7epI8o+EHW4HuDXG1gOHI5GFKkscbATabRjvYsuBL6gN54Zk/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410454; c=relaxed/simple;
	bh=qJa3kE6G8/sIR51ZaZVy15sVgm9YDb2D201emaJOzaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMYXa5/CkXv8PaQYg+4c6ZwZbkZCwv+J2spk1mZifkBQDe6ih4MSlK5UV8OHkKXcxdxCTPwOc5Cs53ZRN5EpVJX+JiDO3vgZQFSdAogVi+ARRBuHb+W44zY77mGEIWDZ2MgAybK93M63+oYL6m5luVE7cDerFvJvau9Wx5nIOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuPrwEJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuPrwEJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3685C4CEE2;
	Wed, 23 Apr 2025 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745410454;
	bh=qJa3kE6G8/sIR51ZaZVy15sVgm9YDb2D201emaJOzaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZuPrwEJOSC6vlYGprtTuw50CemnncuW0c5U+bK6x8mne874StdOTD50o12cXcUtQP
	 HDCvDz++vZhk9YjLpwjJVH5WjKu773XxsA4MuQAum5DkkDkjmwCLku+6VaGqBSmCRG
	 G5G+iez/GDxnqmoNBYn96Ja+QI29hUIni5I+8kNmcWvN8nkNamNQ2X9/4Q+qiXa+yZ
	 tJFK29AKCQKfc2TgjIJdFb5hCe821Ab9N2hZT6VOav5Mf3MkpONBxr2GLVSPY/BTlM
	 p607n+YvyLS2YGLIqyW5ReQbD4qnjCZjjYWqowMJJ6qODxdEf8NGpRWOoYyD5vbAUa
	 YNeK6WvWatSvQ==
Message-ID: <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
Date: Wed, 23 Apr 2025 14:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] rust: alloc: add Vec::retain
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-5-deff5eea568a@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250422-vec-methods-v3-5-deff5eea568a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 11:52 AM, Alice Ryhl wrote:
> Unfortunately this can't be a kunit test because it uses the upstream
> Rust implementation of Vec::retain as a comparison, which we can't call
> from a kunit test.

Would it work from the rusttest target? We can use our kernel Vec type from 
there, but I don't remember if we still can use std Vec from there.
