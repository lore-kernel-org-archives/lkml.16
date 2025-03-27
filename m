Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048492EAE6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087731; cv=none; b=TV86diey3x4sl+5V1Uv82Q6/1R3bqY8effzWgvVefMk75QBPfihVYChU7xABli3snbwyAP0xxv5WnULQFcbwhyy+rcBCYncouqg/27/OHVGB966XbWBev2ngKv2BEZeydsW5q4URDfCKK8CrQiRE2LqoKKxc7YlZweSf/m1+0v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087731; c=relaxed/simple;
	bh=oKZeyOlcmWhv+Tjy/QuaTCsTxF/1DkLzixlEK/75rmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrtTRWWyJa1Tqgx45MDjrQSC6OD4KuQI2KyR/mEg3IT39m+RMX0+UsmoFc8rSy7tcZqbx4chOHMc+T+Dvm16+pXQU0PMjiEmvNmgZlSOCQSHgLmbOWtXscVlZ0pDl93kH2R9PnX9UfJiU+nUN4oufMZtOfdhC7k1MrwV6xZivGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mas/slcB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mas/slcB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2241053582dso31109215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743087729; x=1743692529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qSWt3uvMh71gDWYUGX7+fPc1Nv/aAAnMr090z0vRF4=;
        b=mas/slcB7LMJEJT59vrOmkPiPex6wsg+AqXWtTr+7ESbVtzwq8sQCKV1yMuQUo3+0a
         TCsP71PMh9bpbgtijjY+JTQ7Dnq+zvmOfiyldFpF2n/v0mghhsrRumgXQ03gBgqEvLmp
         smxPPYYHrJbu6x1UtOlURoKw5T2On6rddhd0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087729; x=1743692529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qSWt3uvMh71gDWYUGX7+fPc1Nv/aAAnMr090z0vRF4=;
        b=aqP3XfI6bIYQ0u62KZZdQMEmYR3JP5pAkzFLFVMcHkGu4hQYbsK2oQs/7RfxcfdNbf
         vZ4a7YBVJCOF0KhbQq1/Tv4i1TRLXPgxaftFTAqdzol8Gpasi/RdqNvU+6lF8tzZENRI
         mxF/xwDMTSCYx6lX+RQ07Vu1Gx0c8Jlg2V1bS2vpyyjY3FSQi2gNsaBQ4+0c4slYhtoO
         GxG7eUWuV2+EbqKh2MHN0T50fK5rl5Xkocsf900eNHimsUKRb1elu5l7bQN7dPG9u5dq
         pBOvdpOTp9jf0jq6A5HVZlswO8GNrN4twyD0LruqpLH5yjnJMtPTuOMZvWk9Sv4qNdy3
         B69w==
X-Forwarded-Encrypted: i=1; AJvYcCVoKY1To5ezSUIhTeU0YWGtQ3YPM/DZ2Nz5ZbTMD/IamJi2zvU/c/wUVMVxCDqwFui4IPRR5O/gvSbpBtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOs6Eybtk1dbdNgStlnCxycCfOqeB4RuY0Oj8fC0RHEDZUCBYK
	Ohm6SwiLEMDEBQk93Kmrj0YDxuCaXnNGV/A3kANm5HS5NxOwQZ0XVJ6S3+kPyiLRs62lYLiajMp
	vjA==
X-Gm-Gg: ASbGncucexql5zpxFsTUL59xRb9uHBhRzaVWUWTUKHU/HF+i/kumDp17D/nldNllz54
	ZOODb7q2gsOXuo1uGKsKCdR5vtiDpA51DF4xR3JzhlrGRIHs7QVGTyyFp7d0jvNYDBsbjFY1J8p
	wIOHFuDGf7yq/xM5TW4sQeT0nwtMQ4vnW2L5AZCnHa5UnyWYZ185bkVEC02k1hi1mjypvK6AAP3
	3EfQyjloktq3JJBVT3YMn2vtpx3cbe+2GQ4RK9uGJq2Gxnim84vQH+ivsMVazhrJuxISWWQaUhg
	AvnaWtIj1CN53oujwhR7OiGvgZ8CTzjoPssSRfZW7nW/Or8=
X-Google-Smtp-Source: AGHT+IG/IJqrqoT0m0m7gmMVPQjaTlvKtiXxSxIivb95+Nb+Y8jAJm8non/NDiXNCuNHB+d50FJhAA==
X-Received: by 2002:a17:902:cece:b0:224:255b:c92e with SMTP id d9443c01a7336-2280481d10cmr50732785ad.3.1743087729081;
        Thu, 27 Mar 2025 08:02:09 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf93esm316675ad.154.2025.03.27.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:02:08 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:02:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] thunderbolt: do not double dequeue a request
Message-ID: <qdbqm52rasvncb7db5ok5qfep7bfkxq34veihhrd2xdodozdbl@wltsov2h5fcz>
References: <20250327114222.100293-1-senozhatsky@chromium.org>
 <20250327133756.GA3152277@black.fi.intel.com>
 <vxocwwtfwg3tmjm62kcz33ypsg22afccd2ua5jqymbxaxwcigf@nnydc53vu3gv>
 <20250327142038.GB3152277@black.fi.intel.com>
 <jdupmjvntywimlzlhvq3rfsiwmlox6ssdtdncfe3mmo3wonzta@qwlb3wuosv66>
 <20250327145543.GC3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327145543.GC3152277@black.fi.intel.com>

On (25/03/27 16:55), Mika Westerberg wrote:
[..]
> > Yes, if it's scheduled.  If it's already executed then we can schedule
> > again.
> > 
> > 	tb_cfg_request_sync() {
> > 	 tb_cfg_request()
> > 	   schedule_work()
> 
> This point it runs tb_cfg_request_work() which then calls the callback
> (tb_cfg_request_complete()) before it dequeues so "done" is completed.
> 
> > 	                        executes tb_cfg_request_dequeue
> 
> > 	 wait_for_completion_timeout()
> 
> so this will return > 0 as "done" completed..
> 
> > 	   schedule_work()
> > 	                        executes tb_cfg_request_dequeue again
> 
> ..and we don't call this one.

Ah, okay, I see.  Thanks for the explanations.  I'll drop
that one from the commit message then (let me re-spin v3,
just for the history).

[..]
> > Let me see what I can do (we don't normally apply patches that
> > were not in the corresponding subsystem tree).
> > 
> > In the meantime, do you have a subsystem/driver tree that is exposed
> > to linux-next?  If so, would be cool if you can pick up the patch so
> > that it can get some extra testing via linux-next.
> 
> Yes I do, see [1] but it does not work like that. First you should make
> sure you patch works by testing it yourself and then we can pick it up for
> others to test.

Sure, if I had the H/W testing would have done by now.  OK, let me try
to work this out.
