Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7544315F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173647; cv=none; b=I80rb0CT7twWP9/vIKSCNc77EPmxO8a/UkVWyEuXyq5p1ZQSXoYfY51ud98giKpIWT2P3kN6OniIBQNjhqvRgZSKwVVxFULI/2tPSg7ar/gkFBj/Ss7bOIAfVVWmHN1GyAw/hXDn8hh5HQAKj0o+n/DuiWaCseZvdFmM9nXNq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173647; c=relaxed/simple;
	bh=Jn4eWjXxwsoqBV85M6GsL2+wR4fJEbwSADRw9jJ+1DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlqIPYnA1OES3EWd8KBSzfTLmX9GnrgI7Elt9Ftxem1Jo33uTjLGgZt4LhZ0xMhJpOhdVcMe74itbz4Od2EJC5mV/UBqIl35eGOmAINU0YjxUF77ADBju8YGV4q9DFlUClxaw2RZjm/E9E6czlTpQaLLGVWeeA1dbTiAxcbNQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyowpTXs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyowpTXs"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso19844365ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746173645; x=1746778445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9CBhyGDLFpnb+f5rsG3NlbjD1cjKYpOIM2q4JdOS8g=;
        b=cyowpTXsjL2zxgXj1XI9wFYIcQbYM50MxhVTzyX8NC0B+biSwUCQoEw/2/7PU7gmmT
         ulfpw+sw3Ksga/mX6qR488sb9jAWWjSjzsCR/HhV7RJZrDceLrm70nGFXJcqu1+aqc4N
         EyzE8iETxmM+ltSUuE1Z1IVFyUdO9Vb33q5S08qujdsISd+SCvKoh17ShR+vLDM8FB2a
         J85AdBGX3BQ62EKhn0g+NKVAAenOd9JKh/FwaSm61XGWX6ZsKZExqaxa7RufTWop1iHA
         ltXBlO38NIPjT3/X3nvWtwHbsBc39MzxfZTEquBG+HLixgGqRtNonldsuXPWi+wDx6Jk
         Ne/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746173645; x=1746778445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9CBhyGDLFpnb+f5rsG3NlbjD1cjKYpOIM2q4JdOS8g=;
        b=dPlTj+mf28k6i+za/iV7pbKTOpDNacr+VItu1BCvpJOrI0VaYoBeJG8AR45jYSV5Ah
         /WtQYXUdIYKE+IJeMQoN9EXUcKhfwfgXxvtG21DPCdTyvaFEa7CS+lkOOEg5Wa0UF1Rj
         6K6NzMrqAyYREypm6nfmsHEWujIOOiBc2crCp0f0bxtdoWFmutYY5nfp6/Y9kfOs2PAz
         hyGx8QpKi6LwAegNX6BR8bTaVeTpc5CSsZRp+8fI4x6iJZfqdrEaFIrjln2/083PNm+F
         MbiyBruodXdx8OY5lvExaMNnClymLd4Zmz1/gQxkK7WTfGojOmLkLJnuqOeBNmn5uHa7
         SyPA==
X-Forwarded-Encrypted: i=1; AJvYcCVOwb2nMaIvaC9QbolkUBS2WcGZkoX8TYXljPgq6mRpk2c0xxv6991JMQ4q7BDcewmY9Ml2BlLy7ffgMYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqyaUTjzk15rtUHFyN8wvKTNGI4ttDDFVQNYqxyjRdd13PGf4
	0nIzesduTf/R1gqlkGBvHqmOVtmhMWQbaVGjMGr6VjRYW8nOjBE18XOmMlcjMBU=
X-Gm-Gg: ASbGncu+DHEYWsxlyaQKdAdolmWDrbdrRmBh+Y9guUIA6i/Y8zWg9p+oJFGaiPye77S
	oyFwcTJgQf6wQ8blgpnkOayWudR8HnUeoGVTFlj3qseWyTkPqShBir6WgsucrjAaR2Tufs8JBAD
	OQM6Zu254iEKekURC5rOFceWAi8V9pQc8gv5RvCHKM2ahEcrjtT4LHmT8sfvMQmLYr1YxH5MRnN
	ZVeZ2IRAx0z4R5rrnuDhX6V6Hjckd1E3yAmv6RaY02hqd/sp1muoWwUj3SVFfbWR84Xb5jlO5zi
	KWDsUu2d2gQ99an3QsHzbUvwD36fxYdz83QJ/1XchZid1kL9FdYc
X-Google-Smtp-Source: AGHT+IE8k2uHCd5vOWDOxwC36pkdJWkb0CZOrK041eLixQ2GEf6iz7bejpQdIdbRQPU3r3GiD0ut2w==
X-Received: by 2002:a17:903:3bc7:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22e103571b1mr31592105ad.19.1746173645117;
        Fri, 02 May 2025 01:14:05 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm1644065ad.253.2025.05.02.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:14:04 -0700 (PDT)
Date: Fri, 2 May 2025 13:44:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
	quic_shazhuss@quicinc.com
Subject: Re: [PATCH v3 1/9] opp: add new helper API dev_pm_opp_set_level()
Message-ID: <20250502081402.yjagnnjrfva7u4cb@vireshk-i7>
References: <20250502031018.1292-1-quic_ptalari@quicinc.com>
 <20250502031018.1292-2-quic_ptalari@quicinc.com>
 <20250502053758.utawzhq6famwenc2@vireshk-i7>
 <8ba02745-378b-4264-883a-b99764701d0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba02745-378b-4264-883a-b99764701d0b@quicinc.com>

On 02-05-25, 13:31, Praveen Talari wrote:
> Shall i keep commit as you suggested with your SIB.

I already applied it to my tree. You can drop it from your series now.

-- 
viresh
