Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377F1AB6F1;
	Thu, 22 May 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906260; cv=none; b=lNXOUZRfdMbnpo2WNFnHKqfkPsqAgHCzyXwO6iGBAualCpG+KQbOgQrb0bVPDgVb5xuZF/mBQ17FdC7L3bQUoWUASYCqw1yxvU+vGPVmjGbo2LZfrnspB7c6/k8iOSCkFWEMx64QXKFJhxOLImkvnjstnLChxtzeh8eJg6jCsuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906260; c=relaxed/simple;
	bh=jCPrtR+co5QtXIxUKcx9Ji16YPvD1Y1ViAthhJhUujg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssGVYz6S1DQ5dEi2feigBv/u5OQPWJsVGAArMTb3XvH5JCYtg6WYRWidmfv0npOtdpEKVBC74p8/ZMtpWN+3iUhIIefhMRlc3zUK6nmwl80qM9NiGH0Wz5huVHB/55qaN8TUUHQjvoGZ3AMAWaZuHEMQf2B/On3Fl3AWVxyHzqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGi745s1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGi745s1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7DAC4CEED;
	Thu, 22 May 2025 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747906259;
	bh=jCPrtR+co5QtXIxUKcx9Ji16YPvD1Y1ViAthhJhUujg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TGi745s1u4AYsh830wUJ5LwNma9da8VcSNHHE3eCXCOIM3KqoaAzLr3RM8Pdn2Elz
	 13k6JuqkiI0UyQn5GVY69GZyRfgunfJkKM5ibuJUEMxUU2YDFm04xhAALbntxMNJ8n
	 2yNa86G2RO5WsliYpEWjZhA1+1CNx6uZj3f8nVhA4lAWZsb1xPeWrlDVikn5W8PdRh
	 nYHGgorgjevnqSA+YlKvsOHSMKXBhJXNNQIdpSVBErGyf/aQprFU2ucRtqb/JPxeWN
	 rXQMR839P/Q4cVH41/ScCApzd7uUh+fI2pcEmvu+q/CnQFYpUyv3iETRfmApwuPkM5
	 bay6YxeZh3u/A==
From: alexs@kernel.org
To: si.yanteng@linux.dev,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiang.kun2@zte.com.cn
Cc: Alex Shi <alexs@kernel.org>,
	xu.xin16@zte.com.cn,
	yang.yang29@zte.com.cn,
	wang.yaxin@zte.com.cn,
	fan.yu9@zte.com.cn,
	he.peilin@zte.com.cn,
	tu.qiang35@zte.com.cn,
	qiu.yutan@zte.com.cn,
	zhang.yunkai@zte.com.cn,
	ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux next v3] Docs/zh_CN: Translate napi.rst to Simplified Chinese
Date: Thu, 22 May 2025 17:30:25 +0800
Message-ID: <174790621596.181766.8318425479251968426.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202505202059281560ibnRharfZKdmfk-fERTt@zte.com.cn>
References: <202505202059281560ibnRharfZKdmfk-fERTt@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>


On Tue, 20 May 2025 20:59:28 +0800, jiang.kun2@zte.com.cn wrote:
> translate the "napi.rst" into Simplified Chinese.
> 
> Update to commit bf1b8e0abc39("documentation: networking: Add NAPI config")
> 
> 

Applied, thanks!

[1/1] Docs/zh_CN: Translate napi.rst to Simplified Chinese
      commit: 4276b69fcd84f3130552210f6c3be87689bcdb29

Best regards,
-- 
Alex Shi <alexs@kernel.org>
