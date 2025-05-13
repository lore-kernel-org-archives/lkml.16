Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC2188596
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109024; cv=none; b=g4IJfmjGYTS3dnLv/+ei6iZgAgY4v9gIam5Kw+pa7XKvKkvSz+Ti53g0vjrBhHaX01olimmeMAdmVwoBKQCcmlL/hLeFkGe/CIC3pnQpKSmQVxz6uLj7DfVP+DH+0ghpJgH7zyjtdPj/KoB2mP3N5ULx+pkkrs2Jxvm7BOyj9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109024; c=relaxed/simple;
	bh=SUCUcWhEf6oURpMI4/48jK9U0rgf4uvSgUfzkevEIZU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AfeF/otv/az8o2+CkY+s/EhHb4GhwGBUgWXV5BxuUb0oHycwatOg+42okLEfraLv9zy0OEJhatQw9SUPtkIYC8tTLCtGTotIn6UpOg6FJE+zDujtOikw0OlmdjWZM7pOnFCXiYtQBe9BXrKw+xBwTfWcHOf70yXiwZolJvmYg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=j9GxJcQW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="j9GxJcQW"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7423fb98cb1so3334528b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1747109022; x=1747713822; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzzB3RQAsADcI31qVz9GqQrs/q8/eBx88YSQARAhtFs=;
        b=j9GxJcQWW4smzCDkZrncfoOzpLhL+nyhl9LYdwHUjePGo0zOcDikAn9oLgG103muN8
         ZthRnfKjaBmpDjOzjdoQfDdS5jjL9Wb01rRPrGxunG4ruGam5P7vxSN2Ct8O44zX8PvE
         fE+NhvKWfBrEh9Okm97hOW80tMFO4Es+pAjb13bvU3tjgf1dngLpU2BPMZgvCtBhW/gA
         0dRNYEgYqsw0e09l95fcIM0tHtKw+r1ClGaeFLzQVdKWZ1ujmS4FpGfQNpYJCzqvU4xb
         ssTVQDEeV5+u178zijqWfdR0w09JozCwpd+dEC2JZdEyvuTV74WnAPOuEUQQbLQwy2AR
         T6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109022; x=1747713822;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzzB3RQAsADcI31qVz9GqQrs/q8/eBx88YSQARAhtFs=;
        b=UgiU6VtFiefPU5Dwhim6A0hwUaoWRByc2r56cpFNx5/kSdWIkb0lAsPPbs9Vle+DZE
         Td5VDY7SgBmCs+PbJkGSVLWUsT/JWQUOjNz1MochJcFIU+Mf48tbXVgLuCUfcPwNJZY9
         9ZvGpbdp1QEhTLjPRbvvv0PnHu2R6kT1B0y08ytgxEoYiYsfbjCCOjQlY+yZlNJ5p44I
         7CbW71o8tiEhOHlSAVv8wUr7OtC+9tIlaTol4w1coMsS82uhwkhkDKNF1QfNRI/JmKOW
         O26PJkZQ8yGPiBiJ6tRhz7EX25/MPrkyhli03KuCtHbSY6w8yLfUkIsz+q5rUuV8bWNY
         lxaw==
X-Forwarded-Encrypted: i=1; AJvYcCXO6n3JcMQ1P1QD1mVh2CgRzQYpZqetT8YP+8mPbTlJJ5PORVY2wS9uqVeLPrqrenEK5BZzQvlSldCo3SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84AvHGl1BjX0v/ug9nh/sJ6Ve/aRQUHjIIIPVoAWEzNZtfLFV
	Ah3OHRXNjAp2DFxUO6U/Rjnc1BecG3mOFINAHV2wt1Sd2e7WfMRJ29UTHWss5WI=
X-Gm-Gg: ASbGnctvqLmaBb/e2JeJrdkbk2Pfscbj0a0eFCe2rI6tFi0w+2mc5fnTGX/8uTcMXQj
	IKVSl4bhUD7Ykk0TyKt9wh2aBZPZh0Ucq17TwXnVzqi18hzDiWPUxdYAUDaBSZuMpz69VR41ir5
	bfyPI4D2LCB22QZwG1nF2r3Ivr1BuhVdOBChsSAHSoTuJxriDyXByloKFvYmAubC62VJ2ef4Ctl
	nqPGbS0yTyJBMIkjCRiAFxuodPNcbNMCkudO1xcNkHnuKjIvP0j/p/gdKJ70qWHjKbrvPUUDTCt
	5yLdWHSrCGdwfrczwtp4qHstX1Xc6DLu1HJSHNHwSLpNkCLGBWfQDPzOgnxcMmpS
X-Google-Smtp-Source: AGHT+IE6FehQ0Pj2VSk9mpLd2SRg9MECNcebEAawn/KZn7HTf7AREaTP1HNWEQRmjJgttvr6iHqtPA==
X-Received: by 2002:a05:6a21:3292:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-215abb4f8f6mr21761065637.4.1747109022091;
        Mon, 12 May 2025 21:03:42 -0700 (PDT)
Received: from [10.54.24.77] ([143.92.118.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423772750bsm6819207b3a.42.2025.05.12.21.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 21:03:41 -0700 (PDT)
Message-ID: <0c8bf3f2-1620-420e-8858-fe1c2ff5a8e9@shopee.com>
Date: Tue, 13 May 2025 12:03:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Haifeng Xu <haifeng.xu@shopee.com>
Subject: i40e: How the packets will be processed when status_error_len is 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

	If the packets arrive at the rx and then raise soft irq to handle it, but in i40e_clean_rx_irq, status_error_len is 0 and return.
	The data isn't fetchted from the rx buffer, so the how the packets arrive at the rx will be processed?
	
	FYI, the every rx/tx queue has been bounded to one cpu(64 queues, 64 cpus).

Thanks!
