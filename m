Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9B24469C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274717; cv=none; b=fQ6PF7V17I/HSAUDdKFB1aJ9Bq1IdOyQ3f62b09K5+yn0g8nOV2pxdx1zlfzP3i+iit5iD7ZInpY4wyyBbYyHwvl2nwj6YjKWijjjalFV+mqwmgguRJ9zUdtJoRZb4oMNogljPcfcWQcVxbGKZPYUz7DZCoFK6qBCUtH+mK/Fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274717; c=relaxed/simple;
	bh=NHJzgU0aQXfK39wYCmHOvMeydl7411silGVJgkwozwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QH2x8pOm+5nvJinGXjMkGQozIkuddiEj9qYcA9ucYBxQYYbwGDbjKCYVMxwDrYCEnG2joo3bQAFXCvkKvArY1aDTGGPvmWdQFI4b8/Ycmcpu1gt8XJQcb57PcJzLPDcRulMNsNa55/vnAocmKOHshFgm/rV8R0qVc/uuFexRNPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXfSVQ9r; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXfSVQ9r"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a8244e897fso1586941cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751274714; x=1751879514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UU13DdMIaksh/X1KjKcl/Raj5wdqxWH1R0ASLRmV2M=;
        b=tXfSVQ9rNVLvEQn/S262F4MAUbzK3EX67lMCCkpm0foF4u9S0N1ntvvwqJhR4Fvn8W
         ClRbpQj+cfoLPAh2BIjvopomjlurSeL+vBSwcR/CasXCW1VQei1PYpRcmtlhNq86iZa6
         ADPVUDq0hjBQ8Znj5LxNq3ScgZeUTYoJXkA50l5dXqd7f8YmuJZwQvSAIsi8YZa9igto
         g+8vY4eJDVMc3vwmDbxsk/B3gMd7eB/7Ch/JRUycJ6IfVUuX6zorePzWaDGGz4LBE2Rw
         /Em12r+Oxt84VffUz4VNzHqY+jZfnJOXYNoOhUWsk9rHa4A51HYMGGZVijfjzt2MLJXM
         Ev+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274714; x=1751879514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UU13DdMIaksh/X1KjKcl/Raj5wdqxWH1R0ASLRmV2M=;
        b=XLYzjnqnXKtOpfOoaohW0zkGnCiP/f4v9MeJJrM5cSwNGtUC3DaUY8Wm/k8g44gOPY
         loRGlFrDWjGE/DcKarAOlMhfaobO84OeGKV4GUEf7C6QbETGuBdauhV2O5FKnMlp6ERH
         LQMWBm+Ujc8Jybi+gWJf8haOtin7nIM9FlBpTtLvGTnUiDr1mA6gLC4VmtrMwelTBTaf
         gxhfamYDoAHXm+OBd9QzsMQAoIW9ylKz4TdxQftyuHtq9hTC5MyKY2ridMEZnv8SUrxp
         RIcbSDrdKcjPyqIxRhjd5oaPnQYBAfehgQZiNjsaHKCnbBnHFxVOvyAdlI3r+WKL+YnZ
         C1mg==
X-Forwarded-Encrypted: i=1; AJvYcCUnZkqTeMaktW+3SSbF4QkdonhIVttTI08vIqgB9fYyCZ3lKGte/tE0LjRsMdGCB0j0QzvXBW3tyQuH5oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rj2HxCNOGm6k1pmPefro5tzRlZDW0phaYaHhG4DWZKPpxVQS
	t41DkxZ3tXMh5yKRE3cNd/+zhHazhpgx7u1+Uju5qwJ3VjVPHeFaTCmxYVXIV6pK7K3xN5fIR8M
	wuVOclS8TO3PzEXmWBgK0SBSP4vbZZLXJT22/qKdC
X-Gm-Gg: ASbGncs6XrNfE5hf3nuHCOUMcwcfrF6LeiV70Ym1IEnune72rXZXqBf1FJEC7d/PtNf
	kvE8inoOaWYinWL/PqVYmX+NjAgyvmL/FJOTT65OrVAm3+wATumiNqij+DYpmHno7gT+hkMuw3Y
	77hXvgIY9oOPDpo9BDkAGz1NDDahGP7VE5lUdK/CH04Hxl/FpjtBektw==
X-Google-Smtp-Source: AGHT+IH4S1MS+PwPXkrKUOVhav123OJMtGMBPV3RNEHzL2SXQX+WgUbIwZMUSECufylzadW0GY39deoW/5+5+fET5lE=
X-Received: by 2002:a05:622a:34c:b0:494:a436:5af6 with SMTP id
 d75a77b69052e-4a7fcb12fcamr225013811cf.47.1751274713821; Mon, 30 Jun 2025
 02:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025063016045077919B2mfJO_YO81tg6CKfHY@zte.com.cn>
In-Reply-To: <2025063016045077919B2mfJO_YO81tg6CKfHY@zte.com.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 30 Jun 2025 02:11:42 -0700
X-Gm-Features: Ac12FXx3UzoZ7hTWdmIYc8ImdO8NBaHRWiXy_DXplPKrL4pToPVr0gT-jxkA6CI
Message-ID: <CANn89iK-6kT-ZUpNRMjPY9_TkQj-dLuKrDQtvO1140q4EUsjFg@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: add retransmission quit reasons to tracepoint
To: xu.xin16@zte.com.cn
Cc: kuba@kernel.org, kuniyu@amazon.com, ncardwell@google.com, 
	davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, yang.yang29@zte.com.cn, 
	fan.yu9@zte.com.cn, tu.qiang35@zte.com.cn, jiang.kun2@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 1:05=E2=80=AFAM <xu.xin16@zte.com.cn> wrote:
>
> From: Fan Yu <fan.yu9@zte.com.cn>
>
> Problem
> =3D=3D=3D=3D=3D=3D=3D
> When TCP retransmits a packet due to missing ACKs, the retransmission
> may fail for various reasons (e.g., packets stuck in driver queues,
> sequence errors, or routing issues). Currently, these failure reasons
> are internally handled in __tcp_retransmit_skb() but lack visibility to
> userspace, which makes it difficult to diagnose retransmission failures i=
n
> production environments.
>
> Solution
> =3D=3D=3D=3D=3D=3D=3D
> This patch adds a reason field to the tcp_retransmit_skb tracepoint,
> enumerating with explicit failure cases:
> TCP_RETRANS_IN_HOST_QUEUE          (packet still queued in driver)
> TCP_RETRANS_END_SEQ_ERROR          (invalid end sequence)
> TCP_RETRANS_TRIM_HEAD_NOMEM      (trim head no memory)
> TCP_RETRANS_UNCLONE_NOMEM    (skb unclone keeptruesize no memory)
> TCP_RETRANS_FRAG_NOMEM       (fragment no memory)
> TCP_RETRANS_ROUTE_FAIL       (routing failure)
> TCP_RETRANS_RCV_ZERO_WINDOW  (closed recevier window)
> TCP_RETRANS_PSKB_COPY_NOBUFS (no buffer for skb copy)
> TCP_RETRANS_QUIT_UNDEFINED   (quit reason undefined)

'undefined' ?

>
> Impact
> =3D=3D=3D=3D=3D=3D
> 1. Enables BPF programs to filter retransmission failures by reason.
> 2. Allows precise failure rate monitoring via ftrace.
>
> Co-developed-by: xu xin <xu.xin16@zte.com.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
> Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>

Problem is that this patch breaks the original trace point, without
any mention of the potential consequences in the changelog ?

commit e086101b150ae8e99e54ab26101ef3835fa9f48d
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Fri Oct 13 13:03:16 2017 -0700

    tcp: add a tracepoint for tcp retransmission
