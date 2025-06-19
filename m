Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD261D9A5F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354376; cv=none; b=jSVBHtvlCvDnh6rFELpTVb93JvHSqWj85bCRDF1bFeDXKqWACZ6pdIhPjuggm2aqhw5AuIFd1QhcbwbLy7aZdkI0m/4Gw1z65Tg4++eN7VeJaRefs1MOVzjAmcIzOzLQuKV7+gF6z/wHYbA6fPD0QyPwjkkrjuD+/K05Li3u+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354376; c=relaxed/simple;
	bh=WHFA3dt+gXVNZyOzMwYU23xWVhQTSPBOMqpAAE95nE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+ayWGLlQ7gEntre/7Z/uLh6rc2X/f1+8rXFmLIhZ4Scv5HbnVyLj/FXw3UnMK4MnkP94AVI8IPpZ+e4SfK+dMf9yCUQmA8ULGPNfDQdqDpN2kWPEtu53jXzPfnhSPTkiyvfgmwY4xpEpnOSrUDit4tgHhw+yN90slA8Y7smE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gCzK4Jtq; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gCzK4Jtq"
Message-ID: <38415904-6af7-41ef-9963-fe60cc6560ba@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750354362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHFA3dt+gXVNZyOzMwYU23xWVhQTSPBOMqpAAE95nE8=;
	b=gCzK4JtqUv5MIyP+ZDj2ON8lIxmOCbpEvKPCXR72qskW84oCy5cMRGmvu/92FIbvzzPdI+
	yOHz6OmDG6qSII8OBnwCqfEImiIflh9WcRFN+Dtxk7BzURMpFVJ8ntZBSh3hjC2NGbelLT
	/OLy+CCYxsU10mki62CaOvLrxiVkd5I=
Date: Thu, 19 Jun 2025 10:32:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] bpf: Specify access type of bpf_sysctl_get_name
 args
Content-Language: en-GB
To: Jerome Marchand <jmarchan@redhat.com>, bpf@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20250619140603.148942-1-jmarchan@redhat.com>
 <20250619140603.148942-2-jmarchan@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20250619140603.148942-2-jmarchan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/19/25 7:06 AM, Jerome Marchand wrote:
> The second argument of bpf_sysctl_get_name() helper is a pointer to a
> buffer that is being written to. However that isn't specify in the
> prototype.
>
> Until commit 37cce22dbd51a ("bpf: verifier: Refactor helper access
> type tracking"), all helper accesses were considered as a possible
> write access by the verifier, so no big harm was done. However, since
> then, the verifier might make wrong asssumption about the content of
> that address which might lead it to make faulty optimizations (such as
> removing code that was wrongly labeled dead). This is what happens in
> test_sysctl selftest to the tests related to sysctl_get_name.
>
> Add MEM_WRITE flag the second argument of bpf_sysctl_get_name().
>
> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>

You can carry previous ACK if there is no big change. Ack again here.

Acked-by: Yonghong Song <yonghong.song@linux.dev>

