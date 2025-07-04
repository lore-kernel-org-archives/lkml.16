Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF72FCFCD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636591; cv=none; b=XJTH061l88P3E8x6Gf19Mr8zmyVj0ZH9J9iT9uOxC2/5zAGRXLn4yiJgeZACk9RenXMLcFJ/rxQ6Iw9I7pyyIIKE8TH8r74bwfAuEp8EyTMKEhp/RTpDbV9DbLrf/ssAvhS5ef1qnwqK6dppzZ3M73b2Lef09n07fEkQfiTZ+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636591; c=relaxed/simple;
	bh=AisMHPyyHnXr6LrfehGu+nbYIhPritHcUAyk/zBeZhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ezRRFd4H41eNJSslu8yCSbMLKKYwygTvYKs7JGTQRE5plPGTKNE61rVVRY+tYqwbAxC5NJ8Jgty8lwxXq+xm6fCCUbwH+qXrphYuMMUK1SXRwsvZ8/++EYmOo8r98XUfPi3nrCg5xQhZR1/pAux3lsgUPN+4sshcf3L3uSCDYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 564DgtxV076310;
	Fri, 4 Jul 2025 22:42:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 564Dgt77076306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 22:42:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5b068075-5f0d-47e2-8d33-8871a54cdfe5@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 22:42:52 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] WARNING in flush_delayed_work
To: syzbot <syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20250628034941.2001-1-hdanton@sina.com>
 <685f8b74.a70a0220.2f4de1.0008.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <685f8b74.a70a0220.2f4de1.0008.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav404.rs.sakura.ne.jp

#syz fix: usb: hub: Fix flushing of delayed work used for post resume purposes

