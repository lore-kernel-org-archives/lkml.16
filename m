Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832F79D2
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748569355; cv=none; b=W7JpNSO1vPk5dJyyEEqYP04bUQRFtJszLp5l3KvNe1HX5BNrUi9hIkvxUDd1ywb5zfNSBiVcj3P4e6ty08zoaqrNfr/rGON27I+cXjdmRi3u0EA5wEbzdyyw7cTJm0ZiE7PvDuR+co1kiPHq2KJw4VQFO4OZ3str7v4R92rxW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748569355; c=relaxed/simple;
	bh=cqNEZIeAikBA9S5LoErwG+GHn7Rqq2D9jGP+0AMRUo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvIA93zkbC+j2F2/u/qglh7il0Wjsk6sSFv3f9dEWTcT9twTfVBtLvuU3BToAol4kTJgKosJYZ8DJCVKEpnj55Jlj55Rgsl6IHzC5KhMWO4jOXi0K4QoQy14H5l1M/7hT022Mhqk9WVjbpECYpad6iuC7fPPqODz84bluD1Wymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MxMrjF+y; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MxMrjF+y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748569344; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=9bANAxtpsmx7nKk6yVqssw/JdErzzc2/G1fkq3W4Yi0=;
	b=MxMrjF+yhTMSEU88FL9FMUGaX1okc1KjdemxvflLPtiuCAY28LdIt3Ki9jbD6mH4fmP2jaZFSnKhJbvckqUr3ezkRPhgoh/wicQuJl7KofGeNh5vIFxs65eFnmCaRlqqFSzCa4yYCLLov9JnrukodAMM5dC/sEnb/p8ZqbprLGQ=
Received: from 30.178.81.156(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcJJmZO_1748569339 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 May 2025 09:42:23 +0800
Message-ID: <3ab80f7a-d4fd-4417-a728-ea2dd7cf740a@linux.alibaba.com>
Date: Fri, 30 May 2025 09:42:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "Chatre, Reinette" <reinette.chatre@intel.com>
References: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
 <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
 <SJ1PR11MB6083BEDD3F7625B52E677647FC66A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: qinyuntan <qinyuntan@linux.alibaba.com>
In-Reply-To: <SJ1PR11MB6083BEDD3F7625B52E677647FC66A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tony Luck,

Thank you very much for your review and testing of my patch. Reinette 
has provided some suggestions based on the commit logs. After I modify 
the commit log, I will send you the third version of the patch.

Best regards,
Qinyun Tan

On 5/30/25 2:14 AM, Luck, Tony wrote:
>> To resolve these issues:
>>
>> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
>> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>>
>> 2. The hdr.cpu_mask maintained by resctrl constitutes a subset of
>> shared_cpu_map. When reading top-level events, we dynamically select a CPU
>> from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctrl
>> to determine valid CPUs for reading RMID counter via the MSR interface.
>>
>> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
>> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> 
> Took this patch on a test run on a 2 socket Granite Rapids system configured
> in SNC 3 mode.
> 
> While monitoring total memory bandwidth I took the first CPU on NUMA
> nodes {1..5} offline. Monitoring kept working. Brought those back online.
> Still OK. Took all CPUs on NUMA node 4 offline. Still good. Brought those
> CPUs back online. Still good.
> 
> Tested-by: Tony Luck <tony.luck@intel.com>
> 
> -Tony

