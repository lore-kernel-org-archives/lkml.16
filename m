Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA20288513
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248439; cv=none; b=oaBsmf4Fcjdw6zMxATqSwm6T3sa9gb7n4znt0uiE+NQx5rUYpEnNthZg4Q3xJAapEgAXPH1oM4ZZCYmXaXOu+7+/eej+aK3XlxJnrW75QQM3/4n6AJ4xSarJ6+ITJKSYnIBm+WT+UcXiFWq6qKhVZ7dZWrWp8xbGf0/o+U/6Zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248439; c=relaxed/simple;
	bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umf/CE4yOklsA9GSRI74cWalKJArupMAQIR7ZjoXPA5/6uQ2AougpAJSq2Ko/HELBVYtSSVitovakEN8w2y2JV6vMk7v2oQvAp04IJnK60n2oPmaBvA5QWIajrd8kls6DYIN3BmPj62vrpCZmhNxuJoNHqD2qK/QDvIhRcQZau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LPSS/wLw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LPSS/wLw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e4d235811so1815385ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248437; x=1747853237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
        b=LPSS/wLwd4CUdXM4EN6sIL27nwi4vv9JTO5XIR7mSSzIbA9bWJsn71dyWhfoqNzFG2
         GmcIp8aS5O3PP7r3G8B2CkxvX64md5ek+O7OqNydxdhgj5VeEUhmVtFmEIjwfTLqnmQh
         NxjZVRvRLaJErOoUJIqoLGj9xZF06mrOky4XQNkuBkUL7UXMcWMt+WB1FCTd3KBPutxX
         Yf1zf10YARddzUUL1Em2InSozmnK/fBGJyJUdSAJKxCrL159lGY4/+NiqkP7xlcsZVt2
         6yOZbxfG9BrsMdvUmrUotd0Q1qJevsUpQE2TSWTGxUWfywtBerFj+QSFcp2NZoxr/9W1
         8eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248437; x=1747853237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
        b=tNYVsHnAa2Ii5XRYKUEKx1XZ3AtO6IN49Aiz8YLPwtZgQpXAejOGebkYROg2WjBq5K
         dlguuHVwRQSo83mBDkzC+oc4Pcz985zVPR7DAkFKtnL4aDbJ61Pdq112hW184o3p8UWw
         KXjE3DJjcjltTHKDVWNt+BjNI+d4nS9Kt07H1FDE7JN6sALUQyC8p6EnrO+2wChHgGMN
         JRjufno59RfvwuMLalPDMjJy3q5NDz2nU62eHQC1s6t488bcFZOu6n3VoImXjxMddSDp
         Bj3LjMVP1zxPz1YoLE7/KvJrHpUJTxSiijdvEvKuz39TVOUEK17xJAPYjDsPrksN1LuK
         PiDA==
X-Gm-Message-State: AOJu0Yz8cd2p6C3wH+k4LA+NQuxb2HeOMwx1tcMo+d9L4wakXpQ5YWGQ
	5/F7WR3hDJ17pZBNPWGxtzXbljobz5ZpLvReApN2K8vDkDWU5Ac3Z1ip3Is36J7nY7isEqB3LML
	kPN8/MVMaxZag7LqhCtIpjQ0Jit9YYk8DiwwieypSMjQZAciwgTE3
X-Gm-Gg: ASbGncsEdmxdkNaCH6cFyBTOwXoKF6GIyAkUYJWv0Zna0Qpb7268OEw+MwdQRp3SPbQ
	PPig8Rt2jsuXeji59AhyKPOp1ZUN0CsKzUf4YVbKReaSTI2grnYgu0Fpe0n5x2XlZ42nPQ3Frcz
	mBF8SyMsK1KqmPVDIbM9X0JR2zdH0KAcx2386cVYj67JVyX9erv+WZYRlxdhIkXRI=
X-Google-Smtp-Source: AGHT+IGhjfKdP65xyQg67/NXzbV7pW0f+Hu2UEi2yS3ExllYJPmOzVNNcmG9t5YCc8aX8bIxr7a3OZxEdOsRqobUKu4=
X-Received: by 2002:a17:902:d4cc:b0:22e:3c2:d477 with SMTP id
 d9443c01a7336-2319815c4f8mr61594305ad.25.1747248436993; Wed, 14 May 2025
 11:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com> <20250514184136.238446-4-dionnaglaze@google.com>
In-Reply-To: <20250514184136.238446-4-dionnaglaze@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 14 May 2025 11:47:03 -0700
X-Gm-Features: AX0GCFuSqhpxhjpKHFPl-kNkD1G7Ak4DdeEQl0wFSdtzCrO2XNlX70uWf2FExps
Message-ID: <CAAH4kHYiDpE9m4fhnUPkWrBq=pmDwVGx_--zSSjw1wE8irXESQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] The ccp driver can be overloaded even with guest
 request rate limits. The return value of -EBUSY means that there is no
 firmware error to report back to user space, so the guest VM would see this
 as exitinfo2 = 0. The false success can trick the guest to update its message
 sequence number when it shouldn't have.
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Lendacky <Thomas.Lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:42=E2=80=AFAM Dionna Glaze <dionnaglaze@google.c=
om> wrote:
>
> Instead, when ccp returns -EBUSY, that is reported to userspace as the
> throttling return value.
>

Ah, disregard this email. Globbed one too many patch files.


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
