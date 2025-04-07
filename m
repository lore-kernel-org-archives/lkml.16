Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7CA1A8F60
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991932; cv=none; b=OspcmGZloXuEx+rGSEsAGZ2pSBjn/m446OVgK+frHUaqjqipWGMrn2jhWj180vcpbG1JYb/bkaFbUuXz61aMpej3WThHFG5twjf4Fnd605oIunxpW6/ylDr3ArHgxQTOymn7DrrjTbbROjSd0NcchiaOm/XrI95IdmBRkhpUsx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991932; c=relaxed/simple;
	bh=1jdeWWXi13/hetboFMdwN4rP37Vc8xsYW3UO4jUkNMg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tV7c5ArHAaqwCSxf3/90tLNe/Zktrgq+t+zkk8HRAAieKHBIGSCcn5GewizfVsgY1ijyL8mAiH98btwFbxhYurxBeJjhgN98PFS9OVbVJFvI9jqJjW9jJJQLrmoP29cIhJ7bB6ZpczgiRkTNOdXoXkAnbT124I3A9MHxuimVfKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRmooqh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRmooqh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3C8C4CEE3;
	Mon,  7 Apr 2025 02:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743991931;
	bh=1jdeWWXi13/hetboFMdwN4rP37Vc8xsYW3UO4jUkNMg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=qRmooqh4tXcuuYlmRgwMi6zXJwwT4oD4y8uH0EaqLDvjR1hV4dDQU84OAT4ejYMi2
	 CWsSBna9YNnYktXP7E6UAcMDgD2tbLDY/DjBCsPah0pCLaz4MdVdbaQ9rx0z22965M
	 VhMgZNcLts5o6zAOdbcB/EmwK+fNu9bLOA/Z8sT9l14oMfOec8F9dZOV6FTJZHH7Mz
	 KH8yaEgXI5W4ZMk0h0frgdhCa6NI/EoEtbXTajud1y6DiBKvadygnwbGEqQ8g3esl4
	 tKgIQgz9RQpG5fevzRtK145Y6pC6arxis8VhCjBDbzIwk7gvpJg1bL1NnyDLQahRqx
	 DApj0nw4+wq+g==
Message-ID: <2d4c2367-57bf-42bd-9841-9cc2536f9e0f@kernel.org>
Date: Mon, 7 Apr 2025 10:12:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: apportion atomic write's total
 delay to its operations
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250331202835.4057396-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250331202835.4057396-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/25 04:28, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To utilize the delay option of atomic write more useful, need to
> apportion it to each operation of it.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
