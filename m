Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733B2D97A9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030632; cv=none; b=RPhUJ5Hn8mLER4N1tH6XnI3m+0Wp/kgRaYjXEqEEQR0j98xAmsMZi5NAzGy5qC4jp7RFuU38JizohcfEeGTpfjJgS0nnjHbhP1MrE4CIewQtLOgSOutL3aPDgOqAyKdqeyt/4jEjHKVLggkzbqhb7DJhllYZ8RaPsDk5QU3JtMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030632; c=relaxed/simple;
	bh=0QLJgT/Dufa2Voix369RAHnJslBu1zSfSQz4zIFKtAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qPjw2uKh5VZFjKrBEEUvUwco4fnpqeUfCGJt+kuAt/pNNRHgT0TBhkU6KV/mNm1vc94uwf5vt/GaEYc+3E7MHULp92EzQpUvLOnWoSmASTzGP+Tx+q7ZD41UO89lyVilHHSGXy+7sTIUWV+HwSnyaQGNJOM+55+YfRExq5bC9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55RDNcfc010423;
	Fri, 27 Jun 2025 22:23:38 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55RDNcYE010420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Jun 2025 22:23:38 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d1312fe5-a38b-4522-8330-998410da7980@I-love.SAKURA.ne.jp>
Date: Fri, 27 Jun 2025 22:23:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [net?] possible deadlock in team_device_event (3)
To: syzbot <syzbot+b668da2bc4cb9670bf58@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <0000000000004da3b0061808451e@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0000000000004da3b0061808451e@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav405.rs.sakura.ne.jp
X-Virus-Status: clean

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
