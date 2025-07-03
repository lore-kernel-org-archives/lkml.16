Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBD42A9B;
	Thu,  3 Jul 2025 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751516171; cv=none; b=NtrOWVIFaJ8Z5rVcz0gnXGx+QwDzliNIQbGpuBHOlMji3/Kwonlb2mneHNcwX+gUzQjta8hYoBOQkgeBFjStrURR87Oc1j/yzzUD+FeRVZHxDJJ8yey0IWRxV9S9/LDVZh/R3pGVzLakBAklOALd8Xi0RMJfDOZcE1fdGc3fszk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751516171; c=relaxed/simple;
	bh=43j90pzGdWeiAgiVfXavyBcT333K6LixVh+BXWJxlfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=os+HWYk5ysK1nzhdIUxljhCejzdXcP57ptRycqtQ5Dfr9KLQBlcEXt72k4jXQa4yFBNdtz8RL0L7kVIUfY6yUfkPKQsei0yGW9FmZUhOqPzs4e3IOFyPksiXIIpyzgsuftg6PfgWwprr4K3TQbhivTD5fy7Ze/ub6XzobkaQ6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZGSUzJvk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZGSUzJvk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0d5/Ah9mOrTUrWH0LfcMI80pyLyx8BB3qWmTx2bjviw=; b=ZGSUzJvkXXjlXzH9jRiTvdjQTd
	L5P/HO9SKHfbezIP3A6rwI+ZAD6WFtF1E0kvi+/QzSlab1EN8qaP0cvNHKfR6xq2cBP6MiBg+Ec+4
	mj0WEJ9qUIbZtjw1a9kSI6FtKo8fTeuQpjOg0jTGafaJHeZY2VLil4yd+PkFYAvmxH6daz9+tGdtm
	8qviER4egEKWkUxFnehG13BkL6RbUOk+XWzn4nObvVftr79YgbYn7rYWCJgvU9n3YJFfydIecSLa1
	nZxmsne/7ngid52ZayE6xaS6CBT6hMr9mgIWSBkPNrbJcEibl1AEeRY4nmll8o2OK6LVLJG+usrTx
	uiS/suZA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXBMj-00000007cI2-04Nd;
	Thu, 03 Jul 2025 04:16:05 +0000
Message-ID: <194f16f5-4e26-460f-ae4c-8a5f93088fae@infradead.org>
Date: Wed, 2 Jul 2025 21:16:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGX30ATQaD2EjWwW@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aGX30ATQaD2EjWwW@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/2/25 8:24 PM, Bagas Sanjaya wrote:
> On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
>> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f7238ff9a94d3dd774
>> --- /dev/null
>> +++ b/Documentation/core-api/list.rst
>> @@ -0,0 +1,847 @@

[snip]

> 
> The text LGTM, thanks!
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 

Please see https://people.kernel.org/tglx/notes-about-netiquette,
especially "Trim replies".

-- 
~Randy

