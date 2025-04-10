Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A32853EB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291225; cv=none; b=YioboaTFh64nN7+isdx7CkbG+jZmdp2usUNwdqwZqAhEd0JHcy/YQnh6p7cMTiyfgc5idSk0r1trxpwlmqAEvefu4zMxTjmJKEIUj4bydDwV/YEyYrjzg1cG/5B3wKh0TBt4JPpd2uPhbIaPJHZ5IiQYhy74+ZD/YF/498ePhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291225; c=relaxed/simple;
	bh=Bv7anAAwObvxDvDICcm94sEz13ZRACkMAjQCRcpJdT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3D5raMEv1HVldnT1fspSLUZLzdqho2RpiGBz5rFYVnVr06j5axo87p84j7V6/dvGdLhkuRv/o9HMv0Gfz2T8jLK/rRW+4tMgMf3fopf/FLsnzMcoF67FBeuu2pSWr2TcncAfoYiwSUB3doWsHOs0MJdPyVlfxLqxu3hdKGDkeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLPbT7bP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLPbT7bP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A182C4CEDD;
	Thu, 10 Apr 2025 13:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291224;
	bh=Bv7anAAwObvxDvDICcm94sEz13ZRACkMAjQCRcpJdT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLPbT7bP645ZQTmXCBT3hvvJiYZCrqyXC/F+E3MyrKBnGY5aNoG55IjcydhBi4Vtn
	 CsG3UkDXzW2TjhqmTzZo0s2ysXvEOFM75iFoZOlD5kWHp1ZiJDkQapHV3kzBS5jKx8
	 vvFrKQwLzZs8OKC5wEZFrzM+kq6L+jfnUabmENl5782nA1rIzLKWhF1Ka5tnbTmyfB
	 NDAd7ufFgtPVKKg1mA774ruR+ynhLJkJYX4jIeEmNRXYZiVc07RTEvarwGA659fEaD
	 N4E5oLEn6yfhRzlm0pTTjz45wGHPuVD6aXRATunAXwgkXLGYyXZjp2URXGYlDQEnLF
	 zbr9oh/6KBn0Q==
Date: Thu, 10 Apr 2025 15:20:22 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: alexs@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 2/4] sched/isolation: clean up housekeeping_cpu
Message-ID: <Z_fFlstqFYGPFLEB@localhost.localdomain>
References: <20250410092423.9831-1-alexs@kernel.org>
 <20250410092423.9831-2-alexs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410092423.9831-2-alexs@kernel.org>

Le Thu, Apr 10, 2025 at 05:24:17PM +0800, alexs@kernel.org a écrit :
> From: Alex Shi <alexs@kernel.org>
> 
> housekeeping_test_cpu will check 'housekeeping_overridden' again in
> itself so we don't need do it again outside. just call
> housekeeping_test_cpu is fine.

The point is to do it in the headers, so there is no function
call in the off case.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
